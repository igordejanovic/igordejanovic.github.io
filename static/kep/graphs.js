// Animacija talasa na prvom slajdu
var talas_prvi_animate = true;

prvi_slajd_talas_animate_fn = function(){
    var $talas_prvi = $('#talas-prvi');
    $talas_prvi.width(0);

    talas_prvi_animate = true;

    function animate_talas() {
            $talas_prvi.animate({
                width: "780px"
            }, 4000, "linear", function() {
              if(talas_prvi_animate){
                $talas_prvi.width(0);
                animate_talas();
              }
            });
        }
        animate_talas();
}


$(document).ready(prvi_slajd_talas_animate_fn);

Reveal.addEventListener('slidechanged', function(event){
  // Zaustavi animaciju kada se napusti slajd
  if(typeof event.previousSlide !== 'undefined' &&
      event.previousSlide.getAttribute('data-state')=='prvi-slajd'){
    talas_prvi_animate = false;
  }
});


// Obrada dogadjaja pojave fragmenata
Reveal.addEventListener('fragmentshown', function(event){
  if ($(event.fragment).hasClass('kep-start-animation')){
    $('#neciljni').width(0);
    $('#ciljni').width(0);
    $('#nota').fadeIn().effect('shake').fadeOut(function(){
      $('#neciljni-freq').show();
      $('#neciljni').animate({'width':380}, 2000, function(){
        $('#neciljni-natpis').show();
        $('#neciljni-freq').hide();
        $('#ciljni-freq').show();
        $('#nota').fadeIn().effect('shake').fadeOut(function(){
          $('#ciljni').animate({'width':380}, 2000, function(){
            $('#ciljni-natpis').show();
          });
        });
      });
    });
  }
});



Reveal.addEventListener( 'kep-auditivno', function() {
    $('#nota').hide();
    $('#neciljni-freq').hide();
    $('#neciljni-natpis').hide();
    $('#ciljni-freq').hide();
    $('#ciljni-natpis').hide();
    $('#neciljni').width(0);
    $('#ciljni').width(0);
});



//DISTRIBUCIJA PREMA GODINAMA ŽIVOTA
Reveal.addEventListener( 'socdem-1', function() {
  $('#socdem-1-1').highcharts({
          chart: {
              type: 'pie',
              options3d: {
                  enabled: true,
                  alpha: 45
              },
          },
          title: {
              text: 'Kontrolna grupa',
              y: 380
          },
          series: [{
              name: 'Kontrolna grupa',
              data: [
                  ['<50', 13],
                  {
                    name: '50-60',
                    y: 53,
                    sliced: true,
                    selected: true
                  },
                  {
                    name: '>60',
                    y: 33,
                    sliced: true,
                    selected: true
                  }
              ]
          }]
      });

  $('#socdem-1-2').highcharts({
          chart: {
              type: 'pie',
              options3d: {
                  enabled: true,
                  alpha: 45
              }
          },
          title: {
              text: 'Pacijenti sa IMU',
              y: 380
          },
          series: [{
              name: 'Pacijenti sa IMU',
              data: [
                  ['<50', 12],
                  {
                    name: '50-60',
                    y: 45,
                    sliced: true,
                    selected: true
                  },
                  {
                    name: '>60',
                    y: 43,
                    sliced: true,
                    selected: true
                  }
              ]
          }]
      });
});



// DISTRIBUCIJA PREMA STRUČNOJ SPREMI
Reveal.addEventListener( 'socdem-2', function() {
  $('#socdem-2-1').highcharts({
          chart: {
              type: 'pie',
              options3d: {
                  enabled: true,
                  alpha: 45
              },
          },
          title: {
              text: 'Kontrolna grupa',
              y: 380
          },
          series: [{
              name: 'Kontrolna grupa',
              data: [
                  ['niža', 27],
                  {
                    name: 'srednja',
                    y: 53,
                    sliced: true,
                    selected: true
                  },
                  {
                    name: 'viša',
                    y: 3,
                    sliced: true,
                    selected: true
                  },
                  {
                    name: 'visoka',
                    y: 17,
                    sliced: true,
                    selected: true
                  }
              ]
          }]
      });

  $('#socdem-2-2').highcharts({
          chart: {
              type: 'pie',
              options3d: {
                  enabled: true,
                  alpha: 45
              }
          },
          title: {
              text: 'Pacijenti sa IMU',
              y: 380
          },
          series: [{
              name: 'Pacijenti sa IMU',
              data: [
                  ['niža', 22],
                  {
                    name: 'srednja',
                    y: 62,
                    sliced: true,
                    selected: true
                  },
                  {
                    name: 'viša',
                    y: 5,
                    sliced: true,
                    selected: true
                  },
                  {
                    name: 'visoka',
                    y: 12,
                    sliced: true,
                    selected: true
                  }
              ]
          }]
      });
});




//Distribucija prema bračnom statusu 
Reveal.addEventListener( 'socdem-3', function() {

  $('#socdem-3-1').highcharts({
          chart: {
              type: 'column',
              options3d: {
                enabled: true,
                alpha: 15,
                beta: 5,
                viewDistance: 25,
                depth: 100
            },
            marginTop: 40,
            marginRight: 150,
          },
          xAxis: {
              categories: ['Pacijenti sa IMU', 'Kontrolna grupa'],
          },
          yAxis: {
              min: 0,
              max:100,
              visible: false,

          },
          legend: {
              layout: 'vertical',
              align: 'right',
              verticalAlign: 'bottom',
              x: 10,
              y: -20,
              floating: true,
              borderWidth: 1,
              backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
              shadow: true,
          },
          plotOptions: {
              series: {
                  stacking: 'normal',
                  depth: 80
              }
          },
          series: [{
              name: 'u braku',
              data: [68, 77]
          }, {
              name: 'neoženjen/neudata',
              data: [8, 7]
          }, {
              name: 'udovci',
              data: [23, 17]
          }]
      });


});


// Učestalost P3a talasa u kontrolnoj grupi i grupi sa IMU
Reveal.addEventListener( 'ucestalost-P3a', function() {
  $('#ucP3a-1').highcharts({
          chart: {
              type: 'pie',
              options3d: {
                  enabled: true,
                  alpha: 45
              },
          },
          title: {
              text: 'Kontrolna grupa',
              y: 380
          },
          series: [{
              name: 'Kontrolna grupa',
              data: [
                  ['sa P3a', 13.3],
                  {
                    name: 'bez P3a',
                    y: 86.6,
                    sliced: true,
                    selected: true
                  }
              ]
          }]
      });

  $('#ucP3a-2').highcharts({
          chart: {
              type: 'pie',
              options3d: {
                  enabled: true,
                  alpha: 45
              }
          },
          title: {
              text: 'Pacijenti sa IMU',
              y: 380
          },
          series: [{
              name: 'Pacijenti sa IMU',
              data: [
                  ['sa P3a', 33.3],
                  {
                    name: 'bez P3a',
                    y: 66.6,
                    sliced: true,
                    selected: true
                  },
              ]
          }]
      });
});



// Vaskularni faktori rizika
Reveal.addEventListener( 'vaskriz', function() {
  $('#vaskriz').highcharts({
          chart: {
              type: 'bar',
              options3d: {
                  enabled: true,
                  alpha: 0,
                  beta: 0,
                  viewDistance: 25,
                  depth: 100
              },

          },
          xAxis: {
              categories: ['Pušenje cigareta', 'Gojaznost', 'Hiperlipoproteinemija', 'Dijabetes', 'Hipertenzija'],
          },
          yAxis: {
              min: 0,
              max: 100,
          },
          legend: {
              layout: 'vertical',
              align: 'right',
              verticalAlign: 'top',
              x: 0,
              y: 20,
              floating: true,
              borderWidth: 1,
              backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
              shadow: true,
          },
          credits: {
              enabled: false
          },
          series: [{
              name: 'Kontrola',
              data: [43.33, 10, 20, 3.33, 13.33]
          }, {
              name: 'Pacijenti',
              data: [51.67, 16.67, 65, 23.33, 71.67]
          }]
      });
});





//Prosečne vrednosti latenci P300 na Fz, Cz i Pz elektrodi u grupi ispitanika sa IMU i kontrolnoj grupi 
Reveal.addEventListener( 'latence', function() {
  $('#latence').highcharts({
        chart: {
            type: 'boxplot'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: 0,
            y: 0,
            floating: true,
            borderWidth: 1,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
            shadow: true,
        },

        xAxis: {
            categories: ['Fz', 'Cz', 'Pz'],
            title: {
                text: 'Elektroda'
            },
        },

        yAxis: {
            title: {
                text: 'latencija [ms]'
            },
        },

        series: [{
            name: 'kontrola',
            data: [
              [304.2, 333.6, 356.0, 367.7, 395.8],
              [327.2, 335.6, 352.5, 368.7, 399.4],
              [321.6, 345.6, 362.1, 375.0, 400.0]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        },
        {
            name: 'pacijenti',
            data: [
              [ 316.1, 393.9, 424.0, 452.9, 487.0 ],
              [ 336.2, 398.4, 420.3, 456.3, 483.8 ],
              [ 344.4, 405.4, 436.2, 457.9, 493.0 ] 
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        }]

    });
});



//Prosečne vrednosti amplituda P300 na Fz, Cz i Pz elektrodi u grupi ispitanika sa IMU i kontrolnoj grupi 
Reveal.addEventListener( 'amplitude', function() {
  $('#amplitude').highcharts({
        chart: {
            type: 'boxplot'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: 0,
            y: -10,
            floating: true,
            borderWidth: 1,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
            shadow: true,
        },

        xAxis: {
            categories: ['Fz', 'Cz', 'Pz'],
            title: {
                text: 'Elektroda'
            },
        },

        yAxis: {
            title: {
                text: 'amplitude [μV]'
            },
        },

        series: [{
            name: 'kontrola',
            data: [
              [ 3.250, 6.037, 8.870, 11.613, 13.160 ],
              [ 2.210, 5.965, 9.790, 11.600, 13.960 ],
              [ 3.250, 5.765, 8.570, 10.210, 12.920 ]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        },
        {
            name: 'pacijenti',
            data: [
              [ 2.270, 5.065, 8.675, 10.713, 13.560 ],
              [ 2.350, 6.180, 8.800, 11.412, 13.990 ],
              [ 2.220, 4.730, 6.685, 9.207, 13.160 ]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        }]

    });
});







// 22 - Prosečne vrednosti latenci P300 na Fz, Cz i Pz elektrodi kod ispitanika u akutnoj fazi IMU i tri meseca nakon IMU
Reveal.addEventListener( 'latpac12', function() {
  $('#latpac12').highcharts({
        chart: {
            type: 'boxplot'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: 0,
            y: 0,
            floating: true,
            borderWidth: 1,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
            shadow: true,
        },

        xAxis: {
            categories: ['Fz', 'Cz', 'Pz'],
            title: {
                text: 'Elektroda'
            },
        },

        yAxis: {
            title: {
                text: 'latencija [ms]'
            },
        },

        series: [{
            name: '1. reg.',
            data: [
              [ 316.1, 393.9, 424.0, 452.9, 487.0 ],
              [ 336.2, 398.4, 420.3, 456.3, 483.8 ],
              [ 344.4, 405.4, 436.2, 457.9, 493.0 ] 
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        },
        {
            name: '2. reg.',
            data: [
              [ 324.2, 396.6, 405.6, 426.3, 494.1 ],
              [ 317.1, 383.8, 405.9, 429.6, 499.4 ],
              [ 321.6, 385.4, 408.6, 435.7, 485.4 ]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        }]

    });
});



//23 - Prosečne vrednosti amplituda P300 na Fz, Cz i Pz elektrodi kod ispitanika u akutnoj fazi IMU i tri meseca nakon IMU
Reveal.addEventListener( 'amplpac12', function() {
  $('#amplpac12').highcharts({
        chart: {
            type: 'boxplot'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: 0,
            y: -10,
            floating: true,
            borderWidth: 1,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
            shadow: true,
        },

        xAxis: {
            categories: ['Fz', 'Cz', 'Pz'],
            title: {
                text: 'Elektroda'
            },
        },

        yAxis: {
            title: {
                text: 'amplitude [μV]'
            },
        },

        series: [{
            name: '1. reg.',
            data: [
              [ 2.270, 5.065, 8.675, 10.713, 13.560 ],
              [ 2.350, 6.180, 8.800, 11.412, 13.990 ],
              [ 2.220, 4.730, 6.685, 9.207, 13.160 ]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        },
        {
            name: '2. reg.',
            data: [
              [ 2.140, 4.987, 9.015, 11.033, 14.350 ],
              [ 2.280, 6.247, 8.940, 11.283, 13.780 ],
              [ 2.020, 4.835, 6.815, 9.260, 14.530 ]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        }]

    });
});




// 24 - Prosečne vrednosti latenci P300 na Fz, Cz i Pz elektrodi kod ispitanika muškog i ženskog pola u akutnoj fazi IMU
Reveal.addEventListener( 'latmuszen1', function() {
  $('#latmuszen1').highcharts({
        chart: {
            type: 'boxplot'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'bottom',
            x: 0,
            y: -60,
            floating: true,
            borderWidth: 1,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
            shadow: true,
        },

        xAxis: {
            categories: ['Fz', 'Cz', 'Pz'],
            title: {
                text: 'Elektroda'
            },
        },

        yAxis: {
            title: {
                text: 'latencija [ms]'
            },
        },

        series: [{
            name: 'muškarci',
            data: [
              [ 321.0, 371.8, 401.1, 442.6, 470.2 ],
              [ 336.2, 383.9, 418.8, 446.4, 481.3 ],
              [ 344.4, 399.2, 429.5, 443.0, 479.8 ] 
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        },
        {
            name: 'žene',
            data: [
              [ 366.1, 416.7, 431.2, 461.8, 487.0 ],
              [ 338.1, 405.7, 427.0, 459.3, 483.8 ],
              [ 378.4, 418.5, 441.1, 467.1, 493.0 ]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        }]

    });
});



// 25 - Prosečne vrednosti latenci P300 na Fz, Cz i Pz elektrodi kod ispitanika muškog i ženskog pola tri meseca od IMU
Reveal.addEventListener( 'latmuszen2', function() {
  $('#latmuszen2').highcharts({
        chart: {
            type: 'boxplot'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: 0,
            y: 0,
            floating: true,
            borderWidth: 1,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
            shadow: true,
        },

        xAxis: {
            categories: ['Fz', 'Cz', 'Pz'],
            title: {
                text: 'Elektroda'
            },
        },

        yAxis: {
            title: {
                text: 'latencija [ms]'
            },
        },

        series: [{
            name: 'muškarci',
            data: [
              [ 324.2, 387.5, 403.4, 423.7, 494.1 ],
              [ 317.1, 377.3, 403.3, 415.9, 456.7 ],
              [ 321.6, 386.2, 405.4, 435.4, 485.4 ]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        },
        {
            name: 'žene',
            data: [
              [ 339.2, 398.9, 407.7, 435.8, 486.0 ],
              [ 336.7, 394.0, 412.9, 465.0, 499.4 ],
              [ 328.0, 384.4, 410.4, 439.2, 479.6 ]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        }]

    });
});



// 29 - Prosečne vrednosti latenci P300 na Fz, Cz i Pz elektrodi u akutnoj fazi IMU u zavisnosti od lokalizacije lezije
Reveal.addEventListener( 'latlok', function() {
  $('#latlok').highcharts({
        chart: {
            type: 'boxplot'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: 0,
            y: 0,
            floating: true,
            borderWidth: 1,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
            shadow: true,
        },
        xAxis: {
            categories: ['Fz', 'Cz', 'Pz'],
            title: {
              text: 'Elektroda'
            },
        },
        yAxis: {
            min: 300,
            max: 550,
            title: {
                text: 'latencija [ms]'
            },
        },

        series: [{
            name: 'Supratentorijalne',
            data: [
              [371.8, 410.1, 430.6, 453.9, 487.0],
              [361.0, 411.5, 427.0, 459.0, 481.4],
              [380.5, 426.2, 441.4, 463.0, 493.0]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        },
        {
            name: 'Infratentorijalne',
            data: [
              [316.1, 345.6, 367.4, 385.4, 399.2],
              [336.2, 364.7, 398.4, 411.2, 483.8],
              [344.4, 379.7, 394.9, 423.4, 467.7]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        }]

    });
});

//30 - Prosečne vrednosti amplituda P300 na Fz, Cz i Pz elektrodi u akutnoj fazi IMU u zavisnosti od lokalizacije lezije
Reveal.addEventListener( 'amplok', function() {
  $('#amplok').highcharts({
        chart: {
            type: 'boxplot'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: 0,
            y: -10,
            floating: true,
            borderWidth: 1,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
            shadow: true,
        },

        xAxis: {
            categories: ['Fz', 'Cz', 'Pz'],
            title: {
                text: 'Elektroda'
            },
        },

        yAxis: {
            title: {
                text: 'amplitude [μV]'
            },
        },

        series: [{
            name: 'Supratentorijalne',
            data: [
              [ 2.360, 6.070, 8.740, 10.900, 13.450 ],
              [ 2.350, 6.060, 7.960, 11.480, 13.990 ],
              [ 2.220, 4.360, 6.560, 8.760, 13.160 ]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        },
        {
            name: 'Infratentorijalne',
            data: [
              [ 2.270, 3.685, 7.980, 9.975, 13.560 ],
              [ 3.200, 6.500, 9.410, 11.095, 13.220 ],
              [ 3.170, 4.950, 7.190, 9.270, 10.090 ]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        }]

    });
});


//31 - Oporavak P300 latenci na Fz, Cz i Pz elektrodi kod supratentorijalnih lezija između dve registracije 
Reveal.addEventListener( 'slide-31', function() {
  $('#graph-16').highcharts({
        chart: {
            type: 'boxplot'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: 0,
            y: 0,
            floating: true,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
        },
        xAxis: {
            categories: ['Fz', 'Cz', 'Pz'],
            title: {
              text: 'Elektroda'
            },
        },
        yAxis: {
            min: 300,
            max: 550,
            title: {
                text: 'latencija [ms]'
            },
        },

        series: [{
            name: 'prva',
            data: [
              [371.8, 410.1, 430.6, 453.9, 487.0],
              [361.0, 411.5, 427.0, 459.0, 481.4],
              [380.5, 426.2, 441.4, 463.0, 493.0]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        },
        {
            name: 'druga',
            data: [
              [366.9, 399.9, 409.9, 427.0, 465.1],
              [336.7, 395.3, 412.3, 435.7, 488.7],
              [328.0, 391.5, 415.2, 445.6, 485.4]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        }]

    });
});

//32 - Oporavak P300 latenci na Fz, Cz i Pz elektrodi kod infratentorijalih lezija između dve registracije 
Reveal.addEventListener( 'slide-32', function() {
  $('#graph-17').highcharts({
        chart: {
            type: 'boxplot'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: 0,
            y: 0,
            floating: true,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
        },
        xAxis: {
            categories: ['Fz', 'Cz', 'Pz'],
            title: {
              text: 'Elektroda'
            },
        },
        yAxis: {
            min: 300,
            max: 550,
            title: {
                text: 'latencija [ms]'
            },
        },

        series: [{
            name: 'prva',
            data: [
              [316.1, 345.6, 367.4, 385.4, 399.2],
              [336.2, 364.7, 398.4, 411.2, 470.2],
              [344.4, 379.7, 394.9, 423.4, 467.7]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        },
        {
            name: 'druga',
            data: [
              [324.2, 362.9, 377.7, 407.0, 447.1],
              [317.0, 348.0, 386.0, 401.1, 456.7],
              [321.6, 365.7, 386.2, 412.0, 454.2]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        }]

    });
});


//33 -Prosečne vrednosti latenci P300 na Fz, Cz i Pz elektrodi tri meseca od IMU u zavisnosti od lokalizacije lezije 
Reveal.addEventListener( 'slide-33', function() {
  $('#graph-18').highcharts({
        chart: {
            type: 'boxplot'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: 0,
            y: 0,
            floating: true,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
        },
        xAxis: {
            categories: ['Fz', 'Cz', 'Pz'],
            title: {
              text: 'Elektroda'
            },
        },
        yAxis: {
            min: 300,
            max: 550,
            title: {
                text: 'latencija [ms]'
            },
        },

        series: [{
            name: 'supratentorijalne',
            data: [
              [366.9, 399.9, 409.9, 427.0, 465.1],
              [336.7, 395.3, 412.3, 435.7, 488.7],
              [328.0, 391.5, 415.2, 445.6, 485.4]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        },
        {
            name: 'infratentorijalne',
            data: [
              [324.2, 362.9, 377.7, 407.0, 447.1],
              [317.0, 348.0, 386.0, 401.1, 456.7],
              [321.6, 365.7, 386.2, 412.0, 454.2]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        }]

    });
});


//34 - Prosečne vrednosti latenci P300 na Fz, Cz i Pz elektrodi u akutnoj fazi IMU kod desnostranih i levostranih lezija
Reveal.addEventListener( 'slide-34', function() {
  $('#graph-19').highcharts({
        chart: {
            type: 'boxplot'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: 0,
            y: 0,
            floating: true,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
        },
        xAxis: {
            categories: ['Fz', 'Cz', 'Pz'],
            title: {
              text: 'Elektroda'
            },
        },
        yAxis: {
            min: 300,
            max: 550,
            title: {
                text: 'latencija [ms]'
            },
        },

        series: [{
            name: 'levostrane',
            data: [
              [400.3, 413.7, 437.4, 466.2, 487.0],
              [370.1, 422.8, 444.3, 468.3, 481.4],
              [412.2, 434.5, 443.7, 465.1, 492.0]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        },
        {
            name: 'desnostrane',
            data: [
              [371.8, 402.1, 426.5, 448.6, 465.4],
              [361.0, 393.0, 417.1, 438.7, 459.0],
              [380.5, 404.4, 433.1, 461.4, 493.0]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        }]

    });
});



//35 - Prosečne vrednosti latenci P300 na Fz, Cz i Pz elektrodi tri meseca nakon IMU kod desnostranih i levostranih lezija
Reveal.addEventListener( 'slide-35', function() {
  $('#graph-20').highcharts({
        chart: {
            type: 'boxplot'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: 0,
            y: 0,
            floating: true,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
        },
        xAxis: {
            categories: ['Fz', 'Cz', 'Pz'],
            title: {
              text: 'Elektroda'
            },
        },
        yAxis: {
            min: 300,
            max: 550,
            title: {
                text: 'latencija [ms]'
            },
        },

        series: [{
            name: 'levostrane',
            data: [
              [393.0, 401.0, 410.9, 432.6, 469.0],
              [357.2, 405.8, 423.6, 440.7, 488.7],
              [377.3, 404.4, 418.5, 437.5, 485.4]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        },
        {
            name: 'desnostrane',
            data: [
              [366.9, 398.1, 406.2, 424.4, 462.2],
              [336.7, 376.7, 403.4, 413.9, 469.0],
              [328.0, 389.3, 406.6, 445.7, 479.6]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        }]

    });
});




//36 - Lokalizacija lezija kod bolesnika sa i bez patoloških P300 latenci na Fz elektrodi
Reveal.addEventListener( 'slide-36', function() {

  $('#graph-21').highcharts({
          chart: {
              type: 'column',
              options3d: {
                enabled: true,
                alpha: 15,
                beta: 5,
                viewDistance: 25,
                depth: 100
            },
            marginTop: 40,
            marginRight: 150,
          },
          xAxis: {
              categories: ['Bez patoloških P300', 'Patološki P300'],
          },
          yAxis: {
              min: 0,
              max:100,
              visible: false,

          },
          legend: {
              layout: 'vertical',
              align: 'right',
              verticalAlign: 'bottom',
              x: 10,
              y: -20,
              floating: true,
              borderWidth: 1,
              backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
              shadow: true,
          },
          plotOptions: {
              series: {
                  stacking: 'normal',
                  depth: 80
              }
          },
          series: [{
              name: 'Leva hemisfera',
              data: [22, 51]
          }, {
              name: 'Desna hemisfera',
              data: [26, 41]
          }, {
              name: 'Infratentorijalno',
              data: [52, 8]
          }]
      });
});


//37 - Lokalizacija lezija kod bolesnika sa i bez patoloških P300 latenci na Cz elektrodi
Reveal.addEventListener( 'slide-37', function() {

  $('#graph-22').highcharts({
          chart: {
              type: 'column',
              options3d: {
                enabled: true,
                alpha: 15,
                beta: 5,
                viewDistance: 25,
                depth: 100
            },
            marginTop: 40,
            marginRight: 150,
          },
          xAxis: {
              categories: ['Bez patoloških P300', 'Patološki P300'],
          },
          yAxis: {
              min: 0,
              max:100,
              visible: false,

          },
          legend: {
              layout: 'vertical',
              align: 'right',
              verticalAlign: 'bottom',
              x: 10,
              y: -20,
              floating: true,
              borderWidth: 1,
              backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
              shadow: true,
          },
          plotOptions: {
              series: {
                  stacking: 'normal',
                  depth: 80
              }
          },
          series: [{
              name: 'Leva hemisfera',
              data: [14, 54]
          }, {
              name: 'Desna hemisfera',
              data: [33, 36]
          }, {
              name: 'Infratentorijalno',
              data: [52, 10]
          }]
      });
});



//38 - Lokalizacija lezija kod bolesnika sa i bez patoloških P300 latenci na Pz elektrodi
Reveal.addEventListener( 'slide-38', function() {
  $('#graph-23').highcharts({
          chart: {
              type: 'column',
              options3d: {
                enabled: true,
                alpha: 15,
                beta: 5,
                viewDistance: 25,
                depth: 100
            },
            marginTop: 40,
            marginRight: 150,
          },
          xAxis: {
              categories: ['Bez patoloških P300', 'Patološki P300'],
          },
          yAxis: {
              min: 0,
              max:100,
              visible: false,

          },
          legend: {
              layout: 'vertical',
              align: 'right',
              verticalAlign: 'bottom',
              x: 10,
              y: -20,
              floating: true,
              borderWidth: 1,
              backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
              shadow: true,
          },
          plotOptions: {
              series: {
                  stacking: 'normal',
                  depth: 80
              },
          },
          series: [{
              name: 'Leva hemisfera',
              data: [5, 56]
          }, {
              name: 'Desna hemisfera',
              data: [37, 34]
          }, {
              name: 'Infratentorijalno',
              data: [58, 10]
          }]
      });
});



//39 - Prosečne vrednosti reakcionog vremena kod kontrolne grupe zdravih i ispitanika u akutnoj fazi IMU
Reveal.addEventListener( 'slide-39', function() {
  $('#graph-24').highcharts({
        chart: {
            type: 'boxplot'
        },
        plotOptions: {
          boxplot: {
                  colorByPoint: true
          }
        },
        legend: {
          enabled: false
        },
        xAxis: {
            categories: ['Kontrola', 'Ispitanici 1. reg.'],

            title: {
              text: 'Grupa'
            },
        },
        yAxis: {
            min: 250,
            max: 500,
            title: {
                text: 'Reakciono vreme [ms]'
            },
        },

        series: [{
            data: [
              [288.3, 301.0, 323.6, 351.5, 368.0],
              [322.0, 388.8, 432.0, 449.8, 496.0],
            ],
            tooltip: {
                headerFormat: '<em>grupa {point.key}</em><br/>'
            }
        }]

    });
});


//40 - Prosečne vrednosti reakcionog vremena u akutnoj fazi i tri meseca nakon IMU
Reveal.addEventListener( 'slide-40', function() {
  $('#graph-25').highcharts({
        chart: {
            type: 'boxplot'
        },
        plotOptions: {
          boxplot: {
                  colorByPoint: true
          }
        },
        legend: {
          enabled: false
        },
        xAxis: {
            categories: ['1. registracija', '2. registracija'],

            title: {
              text: 'Ispitanici'
            },
        },
        yAxis: {
            min: 300,
            max: 500,
            title: {
                text: 'Reakciono vreme [ms]'
            },
        },

        series: [{
            data: [
              [322.0, 388.8, 432.0, 449.9, 496.0],
              [321.0, 366.8, 409.0, 433.0, 456.0],
            ],
            tooltip: {
                headerFormat: '<em>{point.key}</em><br/>'
            }
        }]

    });
});



//41 - Poređenje vrednosti reakcionog vremena između muškaraca i žena sa IMU na prvoj i drugoj registraciji
Reveal.addEventListener( 'slide-41', function() {
  $('#graph-26').highcharts({
        chart: {
            type: 'boxplot'
        },
        plotOptions: {
          boxplot: {
                  colorByPoint: true
          }
        },
        legend: {
          enabled: false
        },
        xAxis: {
            categories: ['muškarci', 'žene'],

            title: {
              text: 'Ispitanici 1. reg.'
            },
        },
        yAxis: {
            min: 300,
            max: 500,
            title: {
                text: 'Reakciono vreme [ms]'
            },
        },

        series: [{
            name: '1. registracija',
            data: [
              [322.0, 367.0, 425.0, 434.0, 456.0],
              [334.0, 400.5, 433.0, 455.5, 496.0],
            ],
            tooltip: {
                headerFormat: '<em>{point.key}</em><br/>'
            }
        }]

    });


  $('#graph-27').highcharts({
        chart: {
            type: 'boxplot'
        },
        plotOptions: {
          boxplot: {
                  colorByPoint: true
          }
        },
        legend: {
          enabled: false
        },
        xAxis: {
            categories: ['muškarci', 'žene'],

            title: {
              text: 'Ispitanici 2. reg.'
            },
        },
        yAxis: {
            min: 300,
            max: 500,
            title: {
                text: 'Reakciono vreme [ms]'
            },
        },

        series: [{
            name: '2. registracija',
            data: [
              [321.0, 358.0, 409.0, 433.0, 455.0],
              [356.0, 400.5, 409.0, 433.0, 456.0]
            ],
            tooltip: {
                headerFormat: '<em>{point.key}</em><br/>'
            }
        }]

    });
});



//44 - Kognitivni status (MMSE skor)
Reveal.addEventListener( 'slide-44', function() {
  $('#graph-28').highcharts({
        chart: {
            type: 'column'
        },
        plotOptions: {
          column: {
                  colorByPoint: true,
                  dataLabels: {
                      enabled: false,
                      color: 'yellow',
                      //color: 'red',
                      //style: { fontFamily: '\'Lato\', sans-serif', lineHeight: '18px', fontSize: '17px' }
                      style: { fontSize: '15px', textShadow: false  },
                      format: '{point.y:.0f} %',
                  },
          }
        },
        legend: {
          enabled: false
        },
        xAxis: {
            categories: ['Kontrolna', 'IMU - 1. reg.', 'IMU - 2. reg.'],
            title: {
              text: 'Grupa'
            },
        },
        yAxis: {
            min: 0,
            max: 34,
            title: {
                text: 'MMSE'
            },
        },

        series: [
          {
            data: [ 29.07, 25.05, 26.13 ],
            tooltip: {
                headerFormat: '<em>{point.key}</em><br/>'
            }
          },
          {
            type: 'errorbar',
            color: 'red',
            lineWidth: 2,
            data: [ [28.24, 29.9], [22.66, 27.44], [24.35, 27.91]],
            tooltip: {
                headerFormat: '<em>{point.key}</em><br/>'
            }
          }
       ]
    });
});


//45 - Distribucija pacijenata u odnosu na stepen kognitivnog oštećenja na prvoj i drugoj registraciji
Reveal.addEventListener( 'slide-45', function() {
  $('#graph-29-1').highcharts({
          chart: {
              type: 'pie',
              options3d: {
                  enabled: true,
                  alpha: 45
              },
          },
          plotOptions: {
              pie: {
                  dataLabels: {
                      format: '{point.y:.1f} %'
                  }
              },
            },
            title: {
                text: 'Prva registracija',
                y: 380
            },
            series: [{
                name: 'Prva registracija',
                data: [
                    ['≤24', 46.7],
                    {
                      name: '>24',
                      y: 53.3,
                      sliced: true,
                      selected: true
                    },
                ]
            }]
      });

  $('#graph-29-2').highcharts({
          chart: {
              type: 'pie',
              options3d: {
                  enabled: true,
                  alpha: 45
              },
          },
          plotOptions: {
              pie: {
                  dataLabels: {
                      format: '{point.y:.1f} %'
                  }
              },
          },
          title: {
              text: 'Druga registracija',
              y: 380
          },
          series: [{
              name: 'Druga registracija',
              data: [
                  ['≤24', 15.5],
                  {
                    name: '>24',
                    y: 84.5,
                    sliced: true,
                    selected: true
                  },
              ]
          }]
      });

});




//47 - Razlike u postignuću na testu praćenja traga forme a i b
Reveal.addEventListener( 'slide-47', function() {
  $('#graph-30a').highcharts({
        chart: {
            type: 'column'
        },
        plotOptions: {
          column: {
                  colorByPoint: true,
                  dataLabels: {
                      enabled: false,
                      color: 'yellow',
                      //color: 'red',
                      //style: { fontFamily: '\'Lato\', sans-serif', lineHeight: '18px', fontSize: '17px' }
                      style: { fontSize: '15px', textShadow: false  },
                      format: '{point.y:.0f} %',
                  },
          }
        },
        legend: {
          enabled: false
        },
        xAxis: {
            categories: ['Kontrolna', 'IMU - 1. reg.', 'IMU - 2. reg.'],
            title: {
              text: 'Grupa'
            },
        },
        yAxis: {
            min: 0,
            max: 150,
            title: {
                text: 'TMTA'
            },
        },

        series: [
          {
            data: [ 40.97, 73.47, 64.08],
            tooltip: {
                headerFormat: '<em>{point.key}</em><br/>'
            }
          },
          {
            type: 'errorbar',
            color: 'red',
            lineWidth: 2,
            data: [ [34.33, 47.61], [58.65, 88.29], [48.12, 80.04]],
            tooltip: {
                headerFormat: '<em>{point.key}</em><br/>'
            }
          }
       ]
    });

  $('#graph-30b').highcharts({
        chart: {
            type: 'column'
        },
        plotOptions: {
          column: {
                  colorByPoint: true,
                  dataLabels: {
                      enabled: false,
                      color: 'yellow',
                      //color: 'red',
                      //style: { fontFamily: '\'Lato\', sans-serif', lineHeight: '18px', fontSize: '17px' }
                      style: { fontSize: '15px', textShadow: false  },
                      format: '{point.y:.0f} %',
                  },
          }
        },
        legend: {
          enabled: false
        },
        xAxis: {
            categories: ['Kontrolna', 'IMU - 1. reg.', 'IMU - 2. reg.'],
            title: {
              text: 'Grupa'
            },
        },
        yAxis: {
            min: 0,
            max: 150,
            title: {
                text: 'TMTB'
            },
        },

        series: [
          {
            data: [ 77.57, 114.32, 108.33],
            tooltip: {
                headerFormat: '<em>{point.key}</em><br/>'
            }
          },
          {
            type: 'errorbar',
            color: 'red',
            lineWidth: 2,
            data: [ [66.92, 88.22], [93.77, 134.87], [90.95, 125.71]],
            tooltip: {
                headerFormat: '<em>{point.key}</em><br/>'
            }
          }
       ]
    });
});



// 49 - Razlike u indeksu pažnje i koncentracije<
Reveal.addEventListener( 'slide-49', function() {
  $('#graph-31').highcharts({
        chart: {
            type: 'column'
        },
        plotOptions: {
          column: {
                  colorByPoint: true,
                  dataLabels: {
                      enabled: false,
                      color: 'yellow',
                      //color: 'red',
                      //style: { fontFamily: '\'Lato\', sans-serif', lineHeight: '18px', fontSize: '17px' }
                      style: { fontSize: '15px', textShadow: false  },
                      format: '{point.y:.0f} %',
                  },
          }
        },
        legend: {
          enabled: false
        },
        xAxis: {
            categories: ['Kontrolna', 'IMU - 1. reg.', 'IMU - 2. reg.'],
            title: {
              text: 'Grupa'
            },
        },
        yAxis: {
            min: 0,
            max: 150,
            title: {
                text: 'WMS'
            },
        },

        series: [
          {
            data: [ 99.87, 81.83, 87.1],
            tooltip: {
                headerFormat: '<em>{point.key}</em><br/>'
            }
          },
          {
            type: 'errorbar',
            color: 'red',
            lineWidth: 2,
            data: [ [86.53, 113.22], [71.95, 91.71], [78.09, 96.11]],
            tooltip: {
                headerFormat: '<em>{point.key}</em><br/>'
            }
          }
       ]
    });
});


// 59 - Prosečne vrednosti skorova depresivnosti u grupi sa IMU i kontrolnoj grupi 
Reveal.addEventListener( 'slide-59', function() {
  $('#graph-40').highcharts({
        chart: {
            type: 'column'
        },
        plotOptions: {
          column: {
                  colorByPoint: true,
                  dataLabels: {
                      enabled: false,
                      color: 'yellow',
                      //color: 'red',
                      //style: { fontFamily: '\'Lato\', sans-serif', lineHeight: '18px', fontSize: '17px' }
                      style: { fontSize: '15px', textShadow: false  },
                      format: '{point.y:.0f} %',
                  },
          }
        },
        legend: {
          enabled: false
        },
        xAxis: {
            categories: ['Kontrolna', 'IMU - 1. reg.', 'IMU - 2. reg.'],
            title: {
              text: 'Grupa'
            },
        },
        yAxis: {
            min: 0,
            max: 30,
            title: {
                text: 'BDI'
            },
        },

        series: [
          {
            data: [ 7.43, 14.93, 12.75],
            tooltip: {
                headerFormat: '<em>{point.key}</em><br/>'
            }
          },
          {
            type: 'errorbar',
            color: 'red',
            lineWidth: 2,
            data: [ [4.39, 10.47], [6.32, 23.54], [6.04, 19.46] ],
            tooltip: {
                headerFormat: '<em>{point.key}</em><br/>'
            }
          }
       ]
    });
});



// 60 - Distribucija skorova depresivnosti u grupi ispitanika i kontrolnoj grupi
Reveal.addEventListener( 'slide-60', function() {
  $('#graph-41').highcharts({
          chart: {
              type: 'column',
              options3d: {
                enabled: true,
                alpha: 15,
                beta: 5,
                viewDistance: 25,
                depth: 100
            },
            marginTop: 40,
            marginRight: 150,
          },
          xAxis: {
              categories: ['Bez depresije', 'Blaga do umerena depresije',
                           'Umerena do teška depresija', 'Teška depresija'],
          },
          yAxis: {
              min: 0,
              max:100,
              visible: true,

          },
          legend: {
              layout: 'vertical',
              align: 'right',
              verticalAlign: 'bottom',
              x: 10,
              y: -20,
              floating: true,
              borderWidth: 1,
              backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
              shadow: true,
          },
          plotOptions: {
              column: {
                  dataLabels: {
                      format: '{point.y:.1f} %',
                  },
              },
              series: {
                  // stacking: 'normal',
                  depth: 40
              }
          },
          series: [{
              name: 'Kontrola',
              data: [76.67, 23.33, 0, 0]
          }, {
              name: 'IMU',
              data: [46.67, 30, 15, 8.33]
          }]
      });
});



// 61 - Prosečne vrednosti trenutnih skorova anksioznosti u grupi ca IMU i kontrolnoj grupi
Reveal.addEventListener( 'slide-61', function() {
  $('#graph-43').highcharts({
        chart: {
            type: 'column'
        },
        plotOptions: {
          column: {
                  colorByPoint: true,
                  dataLabels: {
                      enabled: false,
                      color: 'yellow',
                      //color: 'red',
                      //style: { fontFamily: '\'Lato\', sans-serif', lineHeight: '18px', fontSize: '17px' }
                      style: { fontSize: '15px', textShadow: false  },
                      format: '{point.y:.0f} %',
                  },
          }
        },
        legend: {
          enabled: false
        },
        xAxis: {
            categories: ['Kontrolna', 'IMU - 1. reg.', 'IMU - 2. reg.'],
            title: {
              text: 'Grupa'
            },
        },
        yAxis: {
            min: 0,
            max: 60,
            title: {
                text: 'STAA'
            },
        },

        series: [
          {
            data: [ 40.87, 48.25, 46.28],
            tooltip: {
                headerFormat: '<em>{point.key}</em><br/>'
            }
          },
          {
            type: 'errorbar',
            color: 'red',
            lineWidth: 2,
            data: [ [35.15, 46.59], [41.97, 54.53], [39.09, 53.47] ],
            tooltip: {
                headerFormat: '<em>{point.key}</em><br/>'
            }
          }
       ]
    });
});



// 62 - Prosečne vrednosti generalnih skorova anksioznosti u grupi ca IMU i kontrolnoj grupi
Reveal.addEventListener( 'slide-62', function() {
  $('#graph-45').highcharts({
        chart: {
            type: 'column'
        },
        plotOptions: {
          column: {
                  colorByPoint: true,
                  dataLabels: {
                      enabled: false,
                      color: 'yellow',
                      //color: 'red',
                      //style: { fontFamily: '\'Lato\', sans-serif', lineHeight: '18px', fontSize: '17px' }
                      style: { fontSize: '15px', textShadow: false  },
                      format: '{point.y:.0f} %',
                  },
          }
        },
        legend: {
          enabled: false
        },
        xAxis: {
            categories: ['Kontrolna', 'IMU - 1. reg.', 'IMU - 2. reg.'],
            title: {
              text: 'Grupa'
            },
        },
        yAxis: {
            min: 0,
            max: 60,
            title: {
                text: 'STAB'
            },
        },

        series: [
          {
            data: [ 41.57, 51.1, 47.8],
            tooltip: {
                headerFormat: '<em>{point.key}</em><br/>'
            }
          },
          {
            type: 'errorbar',
            color: 'red',
            lineWidth: 2,
            data: [ [35.84, 47.3], [45.72, 56.48], [42.22, 53.38] ],
            tooltip: {
                headerFormat: '<em>{point.key}</em><br/>'
            }
          }
       ]
    });
});



// 63 - Prosečne vrednosti latenci P300 u zavisnosti od skora depresivnosti
Reveal.addEventListener( 'slide-63', function() {
  $('#graph-47').highcharts({
          chart: {
              type: 'column',
              options3d: {
                enabled: true,
                alpha: 15,
                beta: 5,
                viewDistance: 25,
                depth: 100
            },
            marginTop: 40,
            marginRight: 150,
          },
          xAxis: {
              categories: ['Fz', 'Cz', 'Pz'],
          },
          yAxis: {
              min: 300,
              max:500,
              visible: true,

          },
          legend: {
              layout: 'vertical',
              align: 'right',
              verticalAlign: 'bottom',
              x: 10,
              y: -20,
              floating: true,
              borderWidth: 1,
              backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
              shadow: true,
          },
          plotOptions: {
              column: {
                  dataLabels: {
                      format: '{point.y:.0f}',
                  },
              },
              series: {
                  // stacking: 'normal',
                  depth: 40
              }
          },
          series: [{
              name: 'Bez depresije',
              data: [380.6, 402, 409.8]
          }, {
              name: 'Blaga depresija',
              data: [438.5, 435.1, 448.4]
          }, {
              name: 'Umerena depresija',
              data: [460.2, 437.6, 442.1]
          }, {
              name: 'Teška depresija',
              data: [477.4, 465.4, 472.9]
          }]
      });
});



// 64 - Distribucija skorova depresivnosti u grupi bolesnika sa i bez patoloških P300 latenci na Fz elektrodi
Reveal.addEventListener( 'slide-64', function() {
  $('#graph-48a').highcharts({
          chart: {
              type: 'pie',
              options3d: {
                  enabled: true,
                  alpha: 45
              },
          },
          title: {
              text: 'Bez patoloških P300',
              y: 80
          },
          legend:{
            enabled: false
          },
          series: [{
              name: 'Bez patoloških P300',
              data: [
                  { 
                    name: 'Teška depresija' ,
                    y: 0,
                    visible: false
                  },
                  {
                    name: 'Umerena depresija',
                    y: 0,
                    visible: false
                  },
                  {
                    name: 'Blaga depresija',
                    y: 0,
                    visible: false
                  },
                  {
                    name: 'Bez depresije',
                    y: 100,
                  }
              ]
          }]
      });

  $('#graph-48b').highcharts({
          chart: {
              type: 'pie',
              options3d: {
                  enabled: true,
                  alpha: 45
              },
              width: 550,
              marginRight: 100
          },
          title: {
              text: 'Patološki P300',
              y: 80,
              x: -50
          },
          legend: {
              layout: 'vertical',
              align: 'right',
              verticalAlign: 'bottom',
              x: 10,
              y: -20,
              floating: true,
              borderWidth: 1,
              backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
              shadow: true,
          },
          series: [{
              name: 'Kategorije depresivnosti (BDI)',
              data: [
                  { 
                    name: 'Teška depresija' ,
                    y: 13.5,
                    sliced: true,
                    selected: true
                  },
                  {
                    name: 'Umerena depresija',
                    y: 24.3,
                    sliced: true,
                    selected: true
                  },
                  {
                    name: 'Blaga depresija',
                    y: 48.6,
                    sliced: true,
                    selected: true
                  },
                  {
                    name: 'Bez depresije',
                    y: 13.5,
                    sliced: true,
                    selected: true
                  }
              ]
          }]
      });
});




// 65 - Distribucija skorova depresivnosti u grupi bolesnika sa i bez patoloških P300 latenci na Cz elektrodi
Reveal.addEventListener( 'slide-65', function() {
  $('#graph-49a').highcharts({
          chart: {
              type: 'pie',
              options3d: {
                  enabled: true,
                  alpha: 45
              },
          },
          title: {
              text: 'Bez patoloških P300',
              y: 80
          },
          plotOptions: {
            pie: {
              dataLabels: {
                  format: '{point.y:.1f} %',
              },
            }
          },
          legend:{
            enabled: false
          },
          series: [{
              name: 'Kategorije depresivnosti (BDI)',
              data: [
                  { 
                    name: 'Teška depresija' ,
                    y: 0,
                    sliced: true,
                    selected: true
                  },
                  {
                    name: 'Umerena depresija',
                    y: 14.3,
                    sliced: true,
                    selected: true
                  },
                  {
                    name: 'Blaga depresija',
                    y: 14.3,
                    sliced: true,
                    selected: true
                  },
                  {
                    name: 'Bez depresije',
                    y: 71.4,
                    sliced: true,
                    selected: true
                  }
              ]
          }]
      });

  $('#graph-49b').highcharts({
          chart: {
              type: 'pie',
              options3d: {
                  enabled: true,
                  alpha: 45
              },
              width: 550,
              marginRight: 100
          },
          plotOptions: {
            pie: {
              dataLabels: {
                  format: '{point.y:.1f} %',
              },
            }
          },
          title: {
              text: 'Patološki P300',
              y: 80,
              x: -50
          },
          legend: {
              layout: 'vertical',
              align: 'right',
              verticalAlign: 'bottom',
              x: 10,
              y: -20,
              floating: true,
              borderWidth: 1,
              backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
              shadow: true,
          },
          series: [{
              name: 'Kategorije depresivnosti (BDI)',
              data: [
                  { 
                    name: 'Teška depresija' ,
                    y: 12.8,
                    sliced: true,
                    selected: true
                  },
                  {
                    name: 'Umerena depresija',
                    y: 15.4,
                    sliced: true,
                    selected: true
                  },
                  {
                    name: 'Blaga depresija',
                    y: 38.5,
                    sliced: true,
                    selected: true
                  },
                  {
                    name: 'Bez depresije',
                    y: 33.3,
                    sliced: true,
                    selected: true
                  }
              ]
          }]
      });
});




// 66 - Distribucija skorova depresivnosti u grupi bolesnika sa i bez patoloških P300 latenci na Pz elektrodi
Reveal.addEventListener( 'slide-66', function() {
  $('#graph-50a').highcharts({
          chart: {
              type: 'pie',
              options3d: {
                  enabled: true,
                  alpha: 45
              },
          },
          plotOptions: {
            pie: {
              dataLabels: {
                  format: '{point.y:.1f} %',
              },
            }
          },
          title: {
              text: 'Bez patoloških P300',
              y: 60
          },
          legend:{
            enabled: false
          },
          series: [{
              name: 'Kategorije depresivnosti (BDI)',
              data: [
                  { 
                    name: 'Teška depresija' ,
                    y: 0,
                    sliced: true,
                    selected: true
                  },
                  {
                    name: 'Umerena depresija',
                    y: 0,
                    sliced: true,
                    selected: true
                  },
                  {
                    name: 'Blaga depresija',
                    y: 10.5,
                    sliced: true,
                    selected: true
                  },
                  {
                    name: 'Bez depresije',
                    y: 89.5,
                    sliced: true,
                    selected: true
                  }
              ]
          }]
      });

  $('#graph-50b').highcharts({
          chart: {
              type: 'pie',
              options3d: {
                  enabled: true,
                  alpha: 45
              },
              width: 550,
              marginRight: 100
          },
          plotOptions: {
            pie: {
              dataLabels: {
                  format: '{point.y:.1f} %',
              },
            }
          },
          title: {
              text: 'Patološki P300',
              y: 60,
              x: -50
          },
          legend: {
              layout: 'vertical',
              align: 'right',
              verticalAlign: 'bottom',
              x: 10,
              y: -20,
              floating: true,
              borderWidth: 1,
              backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
              shadow: true,
          },
          series: [{
              name: 'Kategorije depresivnosti (BDI)',
              data: [
                  { 
                    name: 'Teška depresija' ,
                    y: 12.2,
                    sliced: true,
                    selected: true
                  },
                  {
                    name: 'Umerena depresija',
                    y: 22,
                    sliced: true,
                    selected: true
                  },
                  {
                    name: 'Blaga depresija',
                    y: 39,
                    sliced: true,
                    selected: true
                  },
                  {
                    name: 'Bez depresije',
                    y: 26.8,
                    sliced: true,
                    selected: true
                  }
              ]
          }]
      });
});


// Prosečne vrednosti NIHSS skora u akutnoj fazi IMU
Reveal.addEventListener( 'nihss-1', function() {
  $('#graph-62').highcharts({
        chart: {
            type: 'boxplot'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: 0,
            y: -10,
            floating: true,
            borderWidth: 1,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
            shadow: true,
        },
        xAxis: {
            categories: ['Fz', 'Cz', 'Pz'],
            title: {
              text: 'Elektroda'
            },
        },
        yAxis: {
            min: 0,
            max: 12,
            title: {
                text: 'NIHSS'
            },
        },

        series: [{
            name: 'Sa patološkim P300',
            data: [
              [6, 7.52, 8.51, 9.5, 10],
              [4, 7.08, 8.49, 9.9, 11],
              [4, 7.16, 8.54, 9.92, 11],
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        },
        {
            name: 'Bez patoloških P300',
            data: [
              [2, 3.96, 6.39, 8.82, 11],
              [2, 4.19, 6.24, 8.29, 9],
              [2, 4.04, 5.89, 7.74, 9]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        }]

    });
});


// Prosečne vrednosti NIHSS skora tri meseca nakon IMU
Reveal.addEventListener( 'nihss-2', function() {
  $('#graph-63').highcharts({
        chart: {
            type: 'boxplot'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: 0,
            y: -10,
            floating: true,
            borderWidth: 1,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
            shadow: true,
        },
        xAxis: {
            categories: ['Fz', 'Cz', 'Pz'],
            title: {
              text: 'Elektroda'
            },
        },
        yAxis: {
            min: 0,
            max: 12,
            title: {
                text: 'NIHSS'
            },
        },

        series: [{
            name: 'Sa patološkim P300',
            data: [
              [1, 3.75, 6.56, 9.37, 11],
              [1, 4.38, 7, 9.62, 10],
              [2, 4.41, 7, 9.59, 11]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        },
        {
            name: 'Bez patoloških P300',
            data: [
              [1, 1.82, 5.03, 8.24, 11],
              [1, 1.62, 4.74, 7.86, 11],
              [1, 1.54, 4.67, 7.8, 11]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        }]

    });
});



// Prosečne vrednosti BI skora u akutnoj fazi IMU
Reveal.addEventListener( 'bi-1', function() {
  $('#graph-70').highcharts({
        chart: {
            type: 'boxplot'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: 0,
            y: -10,
            floating: true,
            borderWidth: 1,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
            shadow: true,
        },
        xAxis: {
            categories: ['Fz', 'Cz', 'Pz'],
            title: {
              text: 'Elektroda'
            },
        },
        yAxis: {
            min: 30,
            max: 110,
            title: {
                text: 'BI'
            },
        },

        series: [{
            name: 'Sa patološkim P300',
            data: [
              [40, 50.68, 64.46, 78.24, 90],
              [40, 53.63, 68.21, 82.79, 90],
              [40, 51.63, 64.88, 78.13, 90],
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        },
        {
            name: 'Bez patoloških P300',
            data: [
              [55, 66.11, 77.17, 88.23, 100],
              [45, 58, 71.43, 84.86, 100],
              [55, 67.82, 78.95, 90.08, 100]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        }]

    });
});


// Prosečne vrednosti BI skora tri meseca nakon IMU
Reveal.addEventListener( 'bi-2', function() {
  $('#graph-71').highcharts({
        chart: {
            type: 'boxplot'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: 0,
            y: -10,
            floating: true,
            borderWidth: 1,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
            shadow: true,
        },
        xAxis: {
            categories: ['Fz', 'Cz', 'Pz'],
            title: {
              text: 'Elektroda'
            },
        },
        yAxis: {
            min: 40,
            max: 110,
            title: {
                text: 'BI'
            },
        },

        series: [{
            name: 'Sa patološkim P300',
            data: [
              [55, 65.66, 73.7, 81.74, 85],
              [55, 63.66, 75.19, 86.72, 100],
              [55, 65.24, 75.56, 85.88, 90]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        },
        {
            name: 'Bez patoloških P300',
            data: [
              [55, 75.44, 85.76, 96.08, 100],
              [64, 75.2, 84.26, 93.32, 100],
              [70, 74, 84.24, 94.48, 100]
            ],
            tooltip: {
                headerFormat: '<em>elektroda {point.key}</em><br/>'
            }
        }]

    });
});
