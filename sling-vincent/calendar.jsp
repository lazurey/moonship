<%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" %><%
%>

<div class="calendar">
  
</div>
<script type="text/javascript">
  var cal = new Calendar();
  cal.generateHTML();
  var wrappers = document.getElementsByClassName('calendar');
  for (var i = 0; i < wrappers.length; i++) {
    wrappers[i].innerHTML = cal.getHTML();
  }

  function draw(year, month) {
    var cal = new Calendar(month, year);
    cal.generateHTML();
    var wrappers = document.getElementsByClassName('calendar');
    for (var i = 0; i < wrappers.length; i++) {
      wrappers[i].innerHTML = cal.getHTML();
    }
  }
</script>

<hr>

<div class="event-box">
  <h3><%= properties.get("eventTitle", "No event") %></h3>
  <div class="event-content">
    <small><%= properties.get("eventDate", "") %></small>
    <p><%= properties.get("eventDetail", "") %></p>
  </div>
</div>