(function() {

  require(['../vendor'], function() {
    console.log('it works!!!');
    return $(document).ready(function() {
      return console.log('it works!!!');
    });
  });

}).call(this);
