// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require_tree .

const home = document.querySelector('li.home');
const homeShow = document.querySelector('.home_show');
const schools = document.querySelector('li.schools');
const schoolShow = document.querySelector('.show_schools');
const lessons = document.querySelector('li.lessons');
const lessonsShow = document.querySelector('.show_lessons');

const hidden = (dashboardView) => {
  dashboardView.classList.add('hidden')
}

home.addEventListener('click', () => {
  homeShow.classList.toggle('hidden')
  hidden(lessonsShow)
  hidden(schoolShow)
});
lessons.addEventListener('click', () => {
  lessonsShow.classList.toggle('hidden')
  hidden(homeShow)
  hidden(schoolShow)
});
schools.addEventListener('click', () => {
  schoolShow.classList.toggle('hidden')
  hidden(lessonsShow)
  hidden(homeShow)
});

document.onkeydown=function(){
    if(window.event.keyCode=='13'){
      document.querySelector('.event_form').submit();
      document.querySelector('.school_form').submit();
      document.querySelector('.lesson_form').submit();
    }
};

const baseUrl = `https://www.googleapis.com/`;

const fetchEvents = (apiKey, userEmail) => {
  fetch(`https://www.googleapis.com/calendar/v3/calendars/${userEmail}/events/`,{
    method: 'get',
    headers: new Headers({
      'Authorization': `Bearer ${apiKey}`
    })
  })
    .then((response) => response.json())
    .then((events) => console.log(events))
    .catch((error) => console.log({ error }));
}
