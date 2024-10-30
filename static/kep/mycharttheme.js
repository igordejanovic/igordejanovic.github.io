/**
 * Dark blue theme for Highcharts JS
 * @author Torstein Honsi
 */

Highcharts.theme = {
  colors: ["#DDDF0D", "#DF5353", "#55BF3B", "#7798BF", "#aaeeee", "#ff0066", "#eeaaee",
           "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
  chart: {
    backgroundColor: null,
    borderColor: null,
    borderWidth: 2,
    className: 'dark-container',
    plotBackgroundColor: null,
    plotBorderColor: null,
    plotBorderWidth: 1
  },
  title: {
    text: null,
    style: {
      color: 'yellow',
      font: 'bold 22px "Trebuchet MS", Verdana, sans-serif'
    }
  },
  subtitle: {
    text: null,
    style: {
      color: 'yellow',
      font: 'bold 12px "Trebuchet MS", Verdana, sans-serif'
    }
  },
  xAxis: {
    title: {
        text: null
    },
    gridLineColor: null,
    gridLineWidth: 1,
    labels: {
      style: {
        color: 'yellow',
        font: '12pt Trebuchet MS, Verdana, sans-serif',
      }
    },
    lineColor: 'yellow',
    tickColor: 'yellow',
    title: {
      style: {
        color: 'yellow',
        fontWeight: 'bold',
        fontSize: '17px',
        fontFamily: 'Trebuchet MS, Verdana, sans-serif'

      }
    }
  },
  yAxis: {
    labels: {
      overflow: 'justify',
      y: 6, // fixing offset
      style: {
        font: '12pt Trebuchet MS, Verdana, sans-serif',
        color: 'yellow'
      }
    },
    lineColor: 'yellow',
    minorTickInterval: null,
    tickColor: 'yellow',
    tickLength: 5,
    tickWidth: 1,
    gridLineColor: null,
    title: {
      text: null,
      style: {
        color: 'yellow',
        fontWeight: 'bold',
        fontSize: '17px',
        fontFamily: 'Trebuchet MS, Verdana, sans-serif'
      }
    }
  },
  tooltip: {
    backgroundColor: 'rgba(0, 0, 0, 0.75)',
    style: {
      color: '#F0F0F0'
    }
  },
  toolbar: {
    itemStyle: {
      color: 'silver'
    }
  },
  plotOptions: {
    pie: {
      dataLabels: {
          enabled: true,
          color: 'yellow',
          //color: 'red',
          //style: { fontFamily: '\'Lato\', sans-serif', lineHeight: '18px', fontSize: '17px' }
          style: { fontSize: '17px', textShadow: false  },
          format: '{point.y:.0f} %',
      },
      showInLegend: true,
      depth: 40,
      borderColor: null,
    },
    bar: {
      dataLabels: {
          enabled: true,
          color: 'yellow',
          //color: 'red',
          //style: { fontFamily: '\'Lato\', sans-serif', lineHeight: '18px', fontSize: '17px' }
          style: { fontSize: '15px', textShadow: false  },
          format: '{point.y:.1f} %',
      },
    },
    column: {
      dataLabels: {
          enabled: true,
          color: 'yellow',
          //color: 'red',
          //style: { fontFamily: '\'Lato\', sans-serif', lineHeight: '18px', fontSize: '17px' }
          style: { fontSize: '15px', textShadow: false  },
          format: '{point.y:.0f} %',
      },
    },
    boxplot: {
          fillColor: null,
          lineWidth: 2,
          medianColor: 'yellow',
          medianWidth: 3,
          stemColor: 'yellow',
          stemDashStyle: 'solid',
          stemWidth: 1,
          whiskerColor: 'yellow',
          whiskerWidth: 3
    },
    line: {
      dataLabels: {
        color: '#CCC'
      },
      marker: {
        lineColor: '#333'
      }
    },
    spline: {
      marker: {
        lineColor: '#333'
      }
    },
    scatter: {
      marker: {
        lineColor: '#333'
      }
    },
    candlestick: {
      lineColor: 'white'
    }
  },
  legend: {
    itemStyle: {
        font: '12pt Trebuchet MS, Verdana, sans-serif',
        color: 'yellow'
    },
    itemHoverStyle: {
      color: '#FFF'
    },
    itemHiddenStyle: {
      color: '#444'
    },
    borderWidth: 1,
    shadow: true
  },
  credits: {
    style: {
      color: '#666'
    }
  },
  labels: {
    style: {
      color: '#CCC'
    }
  },

  navigation: {
    buttonOptions: {
      symbolStroke: '#DDDDDD',
      hoverSymbolStroke: '#FFFFFF',
      theme: {
        fill: {
          linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
          stops: [
            [0.4, '#606060'],
            [0.6, '#333333']
          ]
        },
        stroke: '#000000'
      }
    }
  },

  // scroll charts
  rangeSelector: {
    buttonTheme: {
      fill: {
        linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
        stops: [
          [0.4, '#888'],
          [0.6, '#555']
        ]
      },
      stroke: '#000000',
      style: {
        color: '#CCC',
        fontWeight: 'bold'
      },
      states: {
        hover: {
          fill: {
            linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
            stops: [
              [0.4, '#BBB'],
              [0.6, '#888']
            ]
          },
          stroke: '#000000',
          style: {
            color: 'white'
          }
        },
        select: {
          fill: {
            linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
            stops: [
              [0.1, '#000'],
              [0.3, '#333']
            ]
          },
          stroke: '#000000',
          style: {
            color: 'yellow'
          }
        }
      }
    },
    inputStyle: {
      backgroundColor: '#333',
      color: 'silver'
    },
    labelStyle: {
      color: 'silver'
    }
  },

  navigator: {
    handles: {
      backgroundColor: '#666',
      borderColor: '#AAA'
    },
    outlineColor: '#CCC',
    maskFill: 'rgba(16, 16, 16, 0.5)',
    series: {
      color: '#7798BF',
      lineColor: '#A6C7ED'
    }
  },

  scrollbar: {
    barBackgroundColor: {
        linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
        stops: [
          [0.4, '#888'],
          [0.6, '#555']
        ]
      },
    barBorderColor: '#CCC',
    buttonArrowColor: '#CCC',
    buttonBackgroundColor: {
        linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
        stops: [
          [0.4, '#888'],
          [0.6, '#555']
        ]
      },
    buttonBorderColor: '#CCC',
    rifleColor: '#FFF',
    trackBackgroundColor: {
      linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
      stops: [
        [0, '#000'],
        [1, '#333']
      ]
    },
    trackBorderColor: '#666'
  },

  // special colors for some of the
  legendBackgroundColor: 'rgba(0, 0, 0, 0.5)',
  background2: 'rgb(35, 35, 70, 0.5)',
  dataLabelsColor: '#444',
  textColor: '#C0C0C0',
  maskColor: 'rgba(255,255,255,0.3)'
};

// Apply the theme
var highchartsOptions = Highcharts.setOptions(Highcharts.theme);
