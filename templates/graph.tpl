<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Graph It !</title>
    <link href="/static/css/bootstrap.css" rel="stylesheet">
    <link href="/static/css/graph.css" rel="stylesheet">
    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/js/highcharts.js"></script>
    <script src="/static/js/gray.js"></script>
  </head>
  <body>
    <div id = 'content'>
      <h3>Graph it, but make sure do not release this to public</h3>
% if name is None:
      <br /><br /><br />
      <h1>Waiting for you pr to replace the fucking highcharts.js</h1>
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
