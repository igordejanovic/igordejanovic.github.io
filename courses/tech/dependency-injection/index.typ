#let _ = ```typ
exec typst c "$0" --root "$(readlink -f "$0" | xargs dirname)/./" --input file-0=/images/Motivation.png
⁠```
#set document(title: "Уметање зависности - ", author: "Игор Дејановић")
#set text(lang: "sr")
#set heading(numbering: "1.")
#heading(level: 1, outlined: false, numbering: none)[Садржај] #label("org76e6f7b")
#heading(level: 1)[Мотивација] #label("org8555097")
#heading(level: 2)[Мотивација] #label("org366f2d1")
#list(list.item[Објекти иоле сложенијих апликација формирају сложене графове зависности.])#list(list.item[Како објекат "добија" референце на зависне објекте?])
#heading(level: 2)[Мотивација] #label("orgf2e56d8")
#figure([#image(sys.inputs.file-0)]) #label("org6c3bd99")
#heading(level: 2)[Класичан приступ добављања референци] #label("org3b08630")
#figure([#raw(block: true, lang: "java", "public class RealBillingService implements BillingService {

   @Override
   public Receipt chargeOrder(PizzaOrder order, CreditCard creditCard) {
       CreditCardProcessor processor = new PaypalCreditCardProcessor();
       TransactionLog transactionLog = new DatabaseTransactionLog();

       try {
         ChargeResult result = processor.charge(creditCard, order.getAmount());
         transactionLog.logChargeResult(result);

         return result.wasSuccessful()
             ? Receipt.forSuccessfulCharge(order.getAmount())
             : Receipt.forDeclinedCharge(result.getDeclineMessage());
        } catch (UnreachableException e) {
         transactionLog.logConnectException(e);
         return Receipt.forSystemFailure(e.getMessage());
       }
   }
 }")]) #label("org258efb1")
#heading(level: 2)[Употреба #emph[Singleton\u{2f}Factory] обрасца] #label("orgab8b512")
Објекат се сам брине о добављању референци али то чини посредством глобалне
дељене референце.

#figure([#raw(block: true, lang: "java", "public class RealBillingService implements BillingService {

   public Receipt chargeOrder(PizzaOrder order, CreditCard creditCard) {
     CreditCardProcessor processor = CreditCardProcessorFactory.getInstance();
     TransactionLog transactionLog = TransactionLogFactory.getInstance();

     try {
       ChargeResult result = processor.charge(creditCard, order.getAmount());
       transactionLog.logChargeResult(result);

       return result.wasSuccessful() ?
             Receipt.forSuccessfulCharge(order.getAmount()) :
             Receipt.forDeclinedCharge(result.getDeclineMessage());
     } catch (UnreachableException e) {
       transactionLog.logConnectException(e);
       return Receipt.forSystemFailure(e.getMessage());
     }
   }
 }")]) #label("org671ebad")
#heading(level: 2)[#emph[Singleton\u{2f}Factory] \u{2d} тестирање] #label("orgc81fd92")
#figure([#raw(block: true, lang: "java", "public class RealBillingServiceTest extends TestCase {

   private final PizzaOrder order = new PizzaOrder(100);
   private final CreditCard creditCard = new CreditCard(5000);
   private final InMemoryTransactionLog transactionLog = new InMemoryTransactionLog();
   private final FakeCreditCardProcessor creditCardProcessor = new FakeCreditCardProcessor();

   @Override
   public void setUp() {
     TransactionLogFactory.setInstance(transactionLog);
     CreditCardProcessorFactory.setInstance(creditCardProcessor);
   }

   @Override
   public void tearDown() {
     TransactionLogFactory.setInstance(null);
     CreditCardProcessorFactory.setInstance(null);
   }

   public void testSuccessfulCharge() {
     RealBillingService billingService = new RealBillingService();
     Receipt receipt = billingService.chargeOrder(order, creditCard);

     assertTrue(receipt.hasSuccessfulCharge());
     assertEquals(100.0, receipt.getAmount(), 0.001);
     assertEquals(creditCard, creditCardProcessor.getCardOfOnlyCharge());
     assertEquals(100.0, creditCardProcessor.getAmountOfOnlyCharge(), 0.001);
     assertTrue(transactionLog.wasSuccessLogged());
   }
 }")]) #label("org455b88f")
#heading(level: 2)[Употреба #emph[Singleton\u{2f}Factory] обрасца \u{2d} проблеми] #label("org27b8e7c")
#list(list.item[Дељена референца \u{2d} морамо посебно да пазимо да је постављамо на праве
вредности.])#list(list.item[Немогуће паралелизовати тестове.])
#heading(level: 1)[#emph[Dependency Injection]] #label("org6b87c11")
#heading(level: 2)[Уметање зависности \u{2d} #emph[Dependency Injection]] #label("org6e97af1")
#list(list.item[Измештање надлежности за добављање референци ван објекта \u{2d} неко други ће
се бринути да "уметне" референце пре њихове употребе.])#list(list.item[Предности:
#list(list.item[Код се поједностављује. Зависност између класа је базирана на апстрактним
интерфејсима што позитивно утиче на одржавање (#emph[maintability]), поновну
искористљивост (#emph[reusability]) и поделу посла и надлежности.])#list(list.item[Објекат ће до тренутка позива његових сервисних метода већ бити на
одговарајући начин иницијализован. Смањује се тзв. #emph[boilerplate] код.])#list(list.item[Тестирање је далеко једноставније. Креирање "лажних" објеката (#emph[mockup]) је
могуће и једноставно се изводи. Могућа паралелизација тестова.])])
#heading(level: 2)[Механизми уметања зависности] #label("org2c9ce88")
#list(list.item[Путем параметара конструктора.])#list(list.item[Путем мутатор метода (#emph[setters]).])#list(list.item[Путем имплементираног интерфејса.])
#heading(level: 2)[Инјекција путем параметара конструктора#footnote(label("1"))] #label("org0cd4330")
#figure([#raw(block: true, lang: "java", "Client(Service service) {
     this.service = service;
 }")]) #label("org4c7fafb")

#hide[#footnote[Wikipedia \u{2d} Depdendency Injection: #link("https://en.wikipedia.org/wiki/Dependency_injection")] #label("1")]
#heading(level: 2)[Инјекција путем #emph[setter] метода#footnote(label("1"))] #label("org1b627f5")
#figure([#raw(block: true, lang: "java", "public void setService(Service service) {
     this.service = service;
 }")]) #label("orgd1134c0")
#heading(level: 2)[Инјекција путем интерфејса#footnote(label("1"))] #label("org840615b")
#figure([#raw(block: true, lang: "java", "public interface ServiceSetter {
     public void setService(Service service);
 }
 public class client implements ServiceSetter {

     private Service service;

     @Override
     public void setService(Service service) {
         this.service = service;
     }
 }")]) #label("org4d86cb0")

#figure([#raw(block: true, lang: "java", "public class RealBillingService implements BillingService {
   private final CreditCardProcessor processor;
   private final TransactionLog transactionLog;

   public RealBillingService(CreditCardProcessor processor,
       TransactionLog transactionLog) {
     this.processor = processor;
     this.transactionLog = transactionLog;
   }

   public Receipt chargeOrder(PizzaOrder order, CreditCard creditCard) {
     try {
       ChargeResult result = processor.charge(creditCard, order.getAmount());
       transactionLog.logChargeResult(result);

       return result.wasSuccessful() ?
            Receipt.forSuccessfulCharge(order.getAmount()) :
            Receipt.forDeclinedCharge(result.getDeclineMessage());
     } catch (UnreachableException e) {
       transactionLog.logConnectException(e);
       return Receipt.forSystemFailure(e.getMessage());
     }
   }
 }")]) #label("org43890a4")
#heading(level: 2)[Употреба #emph[DI] \u{2d} тестирање] #label("org4f67dca")
#figure([#raw(block: true, lang: "java", "public class RealBillingServiceTest extends TestCase {

   private final PizzaOrder order = new PizzaOrder(100);
   private final CreditCard creditCard = new CreditCard(5000);

   private final InMemoryTransactionLog transactionLog =
                                              new InMemoryTransactionLog();
   private final FakeCreditCardProcessor creditCardProcessor =
                                              new FakeCreditCardProcessor();

   public void testSuccessfulCharge() {
     RealBillingService billingService = new RealBillingService(
         creditCardProcessor, transactionLog);
     Receipt receipt = billingService.chargeOrder(order, creditCard);

     assertTrue(receipt.hasSuccessfulCharge());
     assertEquals(100.0, receipt.getAmount(), 0.001);
     assertEquals(creditCard, creditCardProcessor.getCardOfOnlyCharge());
     assertEquals(100.0, creditCardProcessor.getAmountOfOnlyCharge(), 0.001);
     assertTrue(transactionLog.wasSuccessLogged());
   }
 }")]) #label("org0d5fb15")
#heading(level: 2)[#emph[DI] контејнери] #label("org58b4294")
#list(list.item[#emph[DI] се може имплементирати и без посебног алата\u{2f}оквира.])#list(list.item[#emph[DI] контејнери омогућавају наметање одређених конвенција за примену овог
обрасца.])#list(list.item[Коришћење #emph[DI] контејера доноси одређене предности:
#list(list.item[Употреба најбоље праксе])#list(list.item[Стандардизација])])
#heading(level: 2)[#emph[DI] контејнери за Јаву] #label("org3441904")
#list(list.item[#raw("Google Guice")])#list(list.item[#raw("PicoContainer")])#list(list.item[#raw("Spring")])#list(list.item[...])
#heading(level: 2)[Стандардизација за програмски језик Јава] #label("org0569e98")
#list(list.item[JSR\u{2d}330#footnote[#link("https://code.google.com/p/atinject/")]])#list(list.item[Дефинише скуп стандардних Јава анотација за #emph[DI]:
#list(list.item[#raw("Provider<T>") \u{2d} Provides instances of T])#list(list.item[#raw("Inject") \u{2d} Identifies injectable constructors, methods, and fields.])#list(list.item[#raw("Named") \u{2d} String\u{2d}based qualifier.])#list(list.item[#raw("Qualifier") \u{2d} Identifies qualifier annotations.])#list(list.item[#raw("Scope") \u{2d} Identifies scope annotations.])#list(list.item[#raw("Singleton") \u{2d} Identifies a type that the injector only instantiates once.])])
#heading(level: 1)[#raw("Google Guice")] #label("org2ee8697")
#heading(level: 2)[#raw("Google Guice")] #label("org44850d7")
#list(list.item[#emph[Lightweight] оквир за #emph[DI] у Јави.])#list(list.item[Развијен од стране Google\u{2d}a.])#list(list.item[Конфигурација базирана на Јава анотацијама.])
#heading(level: 2)[Инјекција путем конструктора] #label("org4b47fde")
#figure([#raw(block: true, lang: "java", "public class RealBillingService implements BillingService {
   private final CreditCardProcessor processor;
   private final TransactionLog transactionLog;

   @Inject
   public RealBillingService(CreditCardProcessor processor,
       TransactionLog transactionLog) {
     this.processor = processor;
     this.transactionLog = transactionLog;
   }

   public Receipt chargeOrder(PizzaOrder order, CreditCard creditCard) {
     try {
       ChargeResult result = processor.charge(creditCard, order.getAmount());
       transactionLog.logChargeResult(result);

       return result.wasSuccessful()
           ? Receipt.forSuccessfulCharge(order.getAmount())
           : Receipt.forDeclinedCharge(result.getDeclineMessage());
      } catch (UnreachableException e) {
       transactionLog.logConnectException(e);
       return Receipt.forSystemFailure(e.getMessage());
     }
   }
 }")]) #label("orgaa32f38")
#heading(level: 2)[Конфигурација за повезивање \u{2d} #emph[binding\u{2f}wiring]] #label("orgeb035d2")
#figure([#raw(block: true, lang: "java", "public class BillingModule extends AbstractModule {
   @Override
   protected void configure() {
     bind(TransactionLog.class).to(DatabaseTransactionLog.class);
     bind(CreditCardProcessor.class).to(PaypalCreditCardProcessor.class);
     bind(BillingService.class).to(RealBillingService.class);
   }
 }")]) #label("org4f165f5")
#heading(level: 2)[Употреба контејнера] #label("org817e9ba")
#figure([#raw(block: true, lang: "java", "public static void main(String[] args) {
   Injector injector = Guice.createInjector(new BillingModule());
   BillingService billingService = injector.getInstance(BillingService.class);
   Receipt result = billingService.chargeOrder(new PizzaOrder(100),
                                               new CreditCard(500));
   System.out.println(result.hasSuccessfulCharge());
 }")]) #label("org9b065bc")
#heading(level: 2)[#emph[Linked Bindings]] #label("org1393c03")
#figure([#raw(block: true, lang: "java", "public class BillingModule extends AbstractModule {
   @Override
   protected void configure() {
     bind(TransactionLog.class).to(DatabaseTransactionLog.class);
     bind(DatabaseTransactionLog.class).to(MySqlDatabaseTransactionLog.class);
   }
 }")]) #label("org2566e31")
#heading(level: 2)[#emph[Custom Bindings Annotations]] #label("org16444bb")
#figure([#raw(block: true, lang: "java", "package example.pizza;
 import com.google.inject.BindingAnnotation;
 import java.lang.annotation.Target;
 import java.lang.annotation.Retention;
 import static java.lang.annotation.RetentionPolicy.RUNTIME;
 import static java.lang.annotation.ElementType.PARAMETER;
 import static java.lang.annotation.ElementType.FIELD;
 import static java.lang.annotation.ElementType.METHOD;

 @BindingAnnotation @Target({ FIELD, PARAMETER, METHOD }) @Retention(RUNTIME)
 public @interface PayPal {}
 ...
 public class RealBillingService implements BillingService {

   @Inject
   public RealBillingService(@PayPal CreditCardProcessor processor,
       TransactionLog transactionLog) {
     ...
   }
 ...
     bind(CreditCardProcessor.class)
         .annotatedWith(PayPal.class)
         .to(PayPalCreditCardProcessor.class);")]) #label("org312c292")
#heading(level: 2)[#emph[\u{40}Named Binding Annotation]] #label("orge39fefd")
#figure([#raw(block: true, lang: "java", "public class RealBillingService implements BillingService {

   @Inject
   public RealBillingService(@Named(\u{22}Checkout\u{22}) CreditCardProcessor processor,
       TransactionLog transactionLog) {
     ...
   }
  ...
  ...
     bind(CreditCardProcessor.class)
         .annotatedWith(Names.named(\u{22}Checkout\u{22}))
         .to(CheckoutCreditCardProcessor.class);")]) #label("org84f670b")
#heading(level: 2)[#emph[Instance Bindings]] #label("orgc6b03ef")
#figure([#raw(block: true, lang: "java", "bind(String.class)
     .annotatedWith(Names.named(\u{22}JDBC URL\u{22}))
     .toInstance(\u{22}jdbc:mysql://localhost/pizza\u{22});
 bind(Integer.class)
     .annotatedWith(Names.named(\u{22}login timeout seconds\u{22}))
     .toInstance(10);")]) #label("org329bbd7")
#heading(level: 2)[#emph[\u{40}Provides Methods]] #label("org0403940")
#figure([#raw(block: true, lang: "java", "public class BillingModule extends AbstractModule {
   @Override
   protected void configure() {
     ...
   }

   @Provides
   TransactionLog provideTransactionLog() {
     DatabaseTransactionLog transactionLog = new DatabaseTransactionLog();
     transactionLog.setJdbcUrl(\u{22}jdbc:mysql://localhost/pizza\u{22});
     transactionLog.setThreadPoolSize(30);
     return transactionLog;
   }
 }
 ...
   @Provides @PayPal
   CreditCardProcessor providePayPalCreditCardProcessor(
       @Named(\u{22}PayPal API key\u{22}) String apiKey) {
     PayPalCreditCardProcessor processor = new PayPalCreditCardProcessor();
     processor.setApiKey(apiKey);
     return processor;
   }")]) #label("org7b3582d")
#heading(level: 2)[#emph[Provider Bindings]] #label("org3998d45")
#figure([#raw(block: true, lang: "java", "public class DatabaseTransactionLogProvider 
       implements Provider<TransactionLog> {
   private final Connection connection;

   @Inject
   public DatabaseTransactionLogProvider(Connection connection) {
     this.connection = connection;
   }

   public TransactionLog get() {
     DatabaseTransactionLog transactionLog = new DatabaseTransactionLog();
     transactionLog.setConnection(connection);
     return transactionLog;
   }
 }
 ...
 public class BillingModule extends AbstractModule {
   @Override
   protected void configure() {
     bind(TransactionLog.class)
         .toProvider(DatabaseTransactionLogProvider.class);
   }
 }")]) #label("orgf72b70d")
#heading(level: 2)[#emph[Scopes]] #label("org080b0a2")
#figure([#raw(block: true, lang: "java", "@Singleton
 public class InMemoryTransactionLog implements TransactionLog {
   /* everything here should be threadsafe! */
 }
 ...
 bind(TransactionLog.class)
   .to(InMemoryTransactionLog.class).in(Singleton.class);
 ...
 @Provides @Singleton
 TransactionLog provideTransactionLog() {
   ...
 }
 ...
 bind(Bar.class).to(Applebees.class).in(Singleton.class);
 bind(Grill.class).to(Applebees.class).in(Singleton.class);")]) #label("org86380cb")
#heading(level: 1)[#raw("Injector")] #label("orgf1cdccf")
#heading(level: 2)[#raw("Injector")] #label("org9e995d3")
#list(list.item[#link("https://github.com/alecthomas/injector")])#list(list.item[Python библиотека за #emph[DI] моделована према #emph[Google Guice] али са #emph[Pythonic API].])
#heading(level: 2)[Једноставан пример] #label("org9808bf4")
#figure([#raw(block: true, lang: "python", ">>> from injector import Injector, inject
 >>> class Inner(object):
 ...     def __init__(self):
 ...         self.forty_two = 42
 ...
 >>> class Outer(object):
 ...     @inject
 ...     def __init__(self, inner: Inner):
 ...         self.inner = inner
 ...
 >>> injector = Injector()
 >>> outer = injector.get(Outer)
 >>> outer.inner.forty_two
 42")]) #label("orgfcd7213")

#list(list.item[Python type hints \u{2d} #link("https://docs.python.org/3/library/typing.html")])
#heading(level: 2)[Сложенији пример] #label("org6c1c791")
#figure([#raw(block: true, lang: "python", "from injector import Key
 Name = Key('name')
 Description = Key('description')")]) #label("orgabcd26d")

#figure([#raw(block: true, lang: "python", "from injector import inject, provider, Module

 class User(object):
     @inject
     def __init__(self, name: Name, description: Description):
         self.name = name
         self.description = description


 class UserModule(Module):
     def configure(self, binder):
        binder.bind(User)


 class UserAttributeModule(Module):
     def configure(self, binder):
         binder.bind(Name, to='Sherlock')

     @provider
     def describe(self, name: Name) -> Description:
         return '%s is a man of astounding insight' % name")]) #label("orga3c869e")

#link("http://injector.readthedocs.io/en/latest/terminology.html#injection")
#heading(level: 2)[Сложенији пример] #label("org928d196")
#figure([#raw(block: true, lang: "python", "from injector import Injector
 injector = Injector([UserModule(), UserAttributeModule()])")]) #label("orgabf87ad")

или

#figure([#raw(block: true, lang: "python", "injector = Injector([UserModule, UserAttributeModule])")]) #label("org6f485f9")

Употреба:

#figure([#raw(block: true, lang: "python", ">>> injector.get(Name)
 'Sherlock'
 >>> injector.get(Description)
 'Sherlock is a man of astounding insight'")]) #label("org7281306")
#figure([#raw(block: true, lang: "python", ">>> user = injector.get(User)
 >>> isinstance(user, User)
 True
 >>> user.name
 'Sherlock'
 >>> user.description
 'Sherlock is a man of astounding insight'")]) #label("orgf6e6e99")
#heading(level: 1)[#raw("Flask injector")] #label("org646ed95")
#heading(level: 2)[#raw("Flask injector")] #label("org7506521")
#list(list.item[Веза између #raw("injector") библиотеке и #raw("Flask") оквира за развој.])
#heading(level: 2)[Пример употребе] #label("orgb3018b5")
#figure([#raw(block: true, lang: "python", "import sqlite3
 from flask import Flask, Config
 from flask.views import View
 from flask_injector import FlaskInjector
 from injector import inject

 app = Flask(__name__)

 @app.route(\u{22}/bar\u{22})
 def bar():
     return render(\u{22}bar.html\u{22})

 @app.route(\u{22}/foo\u{22})
 @inject(db=sqlite3.Connection)
 def foo(db):
     users = db.execute('SELECT * FROM users').all()
     return render(\u{22}foo.html\u{22})
    
 def configure(binder):
     binder.bind(
         sqlite3.Connection,
         to=sqlite3.Connection(':memory:'),
         scope=request,
     )

 FlaskInjector(app=app, modules=[configure])

 app.run()")]) #label("orgaaab979")
#heading(level: 1)[Референце] #label("org9cb3e72")
#list(list.item[#link("https://en.wikipedia.org/wiki/Dependency_injection")[Dependency Injection on Wikipedia] #footnote(link("https://en.wikipedia.org/wiki/Dependency_injection"))])#list(list.item[Martin Fowler, #link("http://www.martinfowler.com/articles/injection.html")[Inversion of Control Containers and the Dependency Injection pattern] #footnote(link("http://www.martinfowler.com/articles/injection.html")), January 2004.])#list(list.item[#link("https://github.com/google/guice/wiki")[Google Guice Wiki] #footnote(link("https://github.com/google/guice/wiki"))])#list(list.item[#link("http://injector.readthedocs.io/en/latest/")[#raw("Injector") dokumentacija] #footnote(link("http://injector.readthedocs.io/en/latest/"))])#list(list.item[#link("https://github.com/alecthomas/flask_injector")[#raw("Flask Injector") projekat] #footnote(link("https://github.com/alecthomas/flask_injector"))])
