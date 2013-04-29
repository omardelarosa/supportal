
var supportal = {};

supportal.checkForUrlVars = function () {
    var vars = [], hash;
    var queryStringIndex = window.location.href.indexOf('?');

    if (queryStringIndex !== -1) {
        var hashes = window.location.href.slice(queryStringIndex+1).split('&');
        for(var i = 0; i < hashes.length; i++)
        {
            hash = hashes[i].split('=');
            vars.push(hash[0]);
            vars[hash[0]] = hash[1];
        }
        console.log(supportal.vars);
      if(vars){
        supportal.fetchTopicById(vars[0]);
      }
    }
    supportal.vars = vars;
};

supportal.fetchTopicById = function (id) {

  var topicReq;
    if (window.XMLHttpRequest) {
      // code for IE7+, Firefox, Chrome, Opera, Safari
        topicReq=new XMLHttpRequest();
      }
    else {
    // code for IE6, IE5
        topicReq=new ActiveXObject("Microsoft.XMLHTTP");
      }

    topicReq.onreadystatechange=function() {
        if (topicReq.readyState==4 && topicReq.status==200) {
          topic = $.parseJSON(topicReq.response);

          //for debuging 
          //console.log(topic);
            $('#display_area').append('<h1 id="result_'+topic.id+'_title" class="result title">'+topic.title+"</h1>");
            //appends p elements for each body              
            $('#display_area').append('<p id="result_'+topic.id+'_body" class="result body">'+topic.body+"</p>");
        return topic;
        }
      };

    topicReq.open("GET","topic/"+id+"",true);
    topicReq.send();
};

supportal.fetchResults = function () {
  var currentquery = document.getElementById('query_input').value;
  //document.getElementById('display_area').innerText = currentquery;

  $.get('/search/'+currentquery,function(data){
    $('#display_area').html(data);
  });

};

supportal.getNavItems = function() {

  $.get('/nav',function(data){
    $('#nav_menu').html(data);
  });

};

supportal.showTopicListing = function () {
  $('.topic.listing').toggle(200);
};

$(document).ready(function(){

  $("form#search_form").submit(function(e){
    e.preventDefault();
    supportal.fetchResults();
  });

});

