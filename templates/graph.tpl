<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Graph It !</title>
    <link href="/static/css/bootstrap.css" rel="stylesheet">
    <link href="/static/css/graph.css" rel="stylesheet">
    <script src="/static/js/jquery.min.js"></script>
    <script src="http://code.highcharts.com/highcharts.js"></script>
    <script src="/static/js/gray.js"></script>
  </head>
  <body>
    <div id = 'content'>
      <h2><a href = '/'>Graph it !</a></h2>
% if name is None:
      <div id = 'usage'>
        <h1><strong>BUT</strong></h1>
        <h1>don't use it on business before your pr to replace highcharts.js</h1>
          <br />
          <h4>How to use this?</h4>
          <ol>
            <li>open "http://host:port/example"</li>
            if this page is already existed, you will see a graph
            <li>input a list of numbers</li>
            format of numbers is: 201,258,197, 308, 401, 200, 150,280,  176 ......</li>
            <li>then "http://host:port/example" will be your graph</li>
          </ol>
      </div>
    % if graphs:
      <div id = 'names'>
      <br />
      <h3>EXISTED GRAPHS &#187;</h3>
      % for graph in graphss:
          <li><a href = '/{{graph}}'>{{graph}}</a></li>
      % end
      </div>
    % end
% else:
      <div id = 'data'>
        <form action = '' method = 'POST'>
          <input type = 'text' name = 'data' placeholder = 'Fill in data like: 2, 3,5,10 ...'></input>
        </form>
      </div>
  % if defined('data') and data is not None:
<script type="text/javascript">
var theme = 'gray';
(function($){ // encapsulate jQuery
    $(function () {
        $('#container').highcharts({
            chart: {
                type: 'line',
                marginRight: 130,
                marginBottom: 25
            },
            title: {
                text: 'A Temp Graph',
                x: -20 //center
            },
            /*
            xAxis: {
                //categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
            },
            */
            yAxis: {
                title: {
                    text: ''
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: ''
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'top',
                x: -10,
                y: 100,
                borderWidth: 0
            },
            series: [
            {
                name: 'V',
                data: [
                % for v in data:
                    {{v}},
                % end
                ]
            },
            ]
        });
    });
})(jQuery);
</script>
  % end
% end
    <div id = 'container'></div>
    </div>
  </body>
</html>
