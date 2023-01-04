from textx import metamodel_from_file
def who_processor(who):
    who.name = who.name.strip()
mm = metamodel_from_file('hello.tx')
mm.register_obj_processors({'Who': who_processor})
print(mm)
m = mm.model_from_file('model.hello')
print([who.name for who in m.to_greet])
