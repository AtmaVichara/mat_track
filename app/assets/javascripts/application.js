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

const home = document.querySelector('li.home');
const homeShow = document.querySelector('.home_show');
const schools = document.querySelector('li.schools');
const schoolShow = document.querySelector('.show_schools');
const lessons = document.querySelector('li.lessons');
const lessonsShow = document.querySelector('.show_lessons');
const students = document.querySelector('li.students');
const studentsShow = document.querySelector('.show_students')

const hidden = (dashboardView) => {
  dashboardView.classList.add('hidden')
}

home.addEventListener('click', () => {
  homeShow.classList.toggle('hidden')
  hidden(lessonsShow)
  hidden(schoolShow)
  hidden(studentsShow)
});
lessons.addEventListener('click', () => {
  lessonsShow.classList.toggle('hidden')
  hidden(homeShow)
  hidden(schoolShow)
  hidden(studentsShow)
});
schools.addEventListener('click', () => {
  schoolShow.classList.toggle('hidden')
  hidden(lessonsShow)
  hidden(homeShow)
  hidden(studentsShow)
});
students.addEventListener('click', () => {
  studentsShow.classList.toggle('hidden')
  hidden(lessonsShow)
  hidden(homeShow)
  hidden(schoolShow)
});

document.onkeydown=function(){
    if(window.event.keyCode=='13'){
      document.querySelector('.event_form').submit();
      document.querySelector('.school_form').submit();
      document.querySelector('.lesson_form').submit();
      document.querySelector('.student_form').submit();
    }
};

$(document).on("change", ".add_attendee_form", () => {
  $.ajax({
    url: "/events/add_attendee/",
    type: "POST",
    data: {
      "student_id" : $('select[name=students]').val(),
      "id" : $('.add_attendee_form').attr('id')
    },
    dataType: "json",
    success: function(data) {
      alert('successfully');
    }
  });
  const fetchAttendees = () => {
    const eventId = $('.add_attendee_form').attr('id');
    fetch(`/api/v1/events/${eventId}/attendees`)
    .then((response) => response.json())
    .then((attendees) => {
      attendees.forEach((attendee) => {
        appendAttendee(attendee);
      })
    .catch((error) => console.log(error));
    });
  }
  const appendAttendee = (attendee) => {
    $('.attendees').html(`
      <li class='name my2'>${attendee.first_name} ${attendee.last_name}</li>
    `);
  }
  fetchAttendees();
});

// const fetchAttendees = () => {
//   const eventId = $('.add_attendee_form').attr('id');
//   fetch(`/api/v1/events/${eventId}/attendees`)
//   .then((response) => response.json())
//   .then((response) => console.log(response))
//   .then((attendees) => appendAttendees(attendees))
//   .catch((error) => console.log( error ));
// }
// const appendAttendees = (attendees) => {
//   $('attendees').empty();
//   attendees.forEach((attendee) => {
//     $('.attendees').prepend(`
//       <li class='name my2'>${attendee.first_name} ${attendee.last_name}</li>
//     `);
//   })
// }
