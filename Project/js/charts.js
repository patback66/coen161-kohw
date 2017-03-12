function getCampData() {
  var dataSet = [{"campid": 1,"name": "Apaches","currentKids": 5}, {"campid": 2,"name": "Eureka","currentKids": 87}, {"campid": 3,"name": "name ","currentKids": 0}, {"campid": 4,"name": "name ","currentKids": 0}, {"campid": 5,"name": "Apaches","currentKids": 5}, {"campid": 6,"name": "Eureka","currentKids": 4}, {"campid": 7,"name": "Santa Clara","currentKids": 24}, {"campid": 8,"name": "Tahoe South","currentKids": 27}, {"campid": 9,"name": "Boulder","currentKids": 21}, {"campid": 10,"name": "Chesapeake","currentKids": 15}, {"campid": 11,"name": "Grapefruit ressort","currentKids": 9}, {"campid": 12,"name": "Grapefruit ressort 2","currentKids": 37}, {"campid": 13,"name": "Little derby","currentKids": 42}, {"campid": 14,"name": "Sweet Bayou","currentKids": 20}, {"campid": 15,"name": "Nestor camp","currentKids": 10}, {"campid": 16,"name": "Lewis and Clark","currentKids": 22}, {"campid": 17,"name": "Robotics village","currentKids": 77}, {"campid": 18,"name": "Salt Camp","currentKids": 33}, {"campid": 19,"name": "Federal Camp","currentKids": 27}];
  $.ajax({
        url: '/coen161-kohw/Project/php/charts.php',
        type: 'post',
        data: {'do': 'getCampersPerLocation'},
        dataType: "json",
        success: function(msg) {
            console.log(msg);
            dataSet = msg["data"];
            buildCampChart(dataSet);
        },
        error: function(xhr) {
            console.log("An error occured: " + xhr.status + " " + xhr.statusText);
            console.log(xhr.responseText);
            buildForumChart(dataSet);
        }
    });
}

function buildCampChart(data) {
  var kids = JSON.parse(data);
  
  //build data json
  var jsonData = [];
  var check = [{
            name: 'Microsoft Internet Explorer',
            y: 56.33
        }, {
            name: 'Chrome',
            y: 24.03,
            sliced: true,
            selected: true
        }, {
            name: 'Firefox',
            y: 10.38
        }, {
            name: 'Safari',
            y: 4.77
        }, {
            name: 'Opera',
            y: 0.91
        }, {
            name: 'Proprietary or Undetectable',
            y: 0.2
        }]
  kids.forEach(function(kid) 
  {
          jsonData.push({"name":kid.name, "y":parseInt(kid.currentKids)});
      
  });
  
  Highcharts.chart('currentCampers', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: 'Current Campers Registered (Last 30 Days)'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.y}</b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.y}',
                style: {
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                }
            }
        }
    },
    series: [{
        name: 'Camp Name',
        colorByPoint: true,
        data: jsonData
    }]
});
}

/*Highcharts.chart('container', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'Students Enrollment'
    },
    xAxis: {
        categories: [
            'Jan',
            'Feb',
            'Mar',
            'Apr',
            'May',
            'Jun',
            'Jul',
            'Aug',
            'Sep',
            'Oct',
            'Nov',
            'Dec'
        ],
        crosshair: true
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Students'
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} Students</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },
    plotOptions: {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        }
    },
    series: [{
        name: 'Tokyo',
        data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

    }, {
        name: 'New York',
        data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]

    }, {
        name: 'London',
        data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]

    }, {
        name: 'Berlin',
        data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]

    }]
});*/

var testData = [{"id": 1,"timestamp": 1488914681}, {"id": 2,"timestamp": 1488914793}, {"id": 3,"timestamp": 1488925958}, {"id": 4,"timestamp": 1488925981}, {"id": 5,"timestamp": 1488928550}, {"id": 7,"timestamp": 1488930808}, {"id": 8,"timestamp": 1488930843}, {"id": 9,"timestamp": 1489005293}];

function getChartData() {
  var posts = testData;
  $.ajax({
        url: '/coen161-kohw/Project/php/charts.php',
        type: 'post',
        data: {'do': 'getForumPosts'},
        dataType: "json",
        success: function(msg) {
            console.log(msg);
            posts = msg["data"];
            buildForumChart(posts);
        },
        error: function(xhr) {
            console.log("An error occured: " + xhr.status + " " + xhr.statusText);
            console.log(xhr.responseText);
            buildForumChart(posts);
        }
    });
}

function buildForumChart(data) {
  var posts = JSON.parse(data);
  
  var ppm = [0,0,0,0,0,0,0,0,0,0,0,0];
  for(var i = 0; i < posts.length; i++) {
    var date = new Date(posts[i].timestamp * 1000);
    var month = date.getMonth();
    ppm[month]++;
  }
  Highcharts.chart('forumChart', {
    chart: {
        type: 'line'
    },
    title: {
        text: 'Monthly Forum Posts'
    },
    xAxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    },
    yAxis: {
        title: {
            text: 'Number of Posts'
        }
    },
    plotOptions: {
        line: {
            dataLabels: {
                enabled: true
            },
            enableMouseTracking: false
        }
    },
    series: [{
        name: 'Number of Posts',
        data: ppm
    }]
  });
}
function getData() {
  
}

$( document ).ready(function() {
    console.log( "building charts!" );
    getCampData();
    getChartData();
});