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
//= require rails-ujs
//= require_tree .

const home = document.querySelector('li.home')
const homeShow = document.querySelector('.home_show')
const schools = document.querySelector('li.schools')
const schoolShow = document.querySelector('.show_schools')
const lessons = document.querySelector('li.lessons')
const lessonsShow = document.querySelector('.show_lessons')
const settings = document.querySelector('li.settings')
const settingsShow = document.querySelector('.show_settings')


const hidden = (data) => {
  data.classList.add('hidden')
}

home.addEventListener('click', () => {
  homeShow.classList.toggle('hidden')
  hidden(lessonsShow)
  hidden(settingsShow)
  hidden(schoolShow)
})
schools.addEventListener('click', () => {
  schoolShow.classList.toggle('hidden')
  hidden(lessonsShow)
  hidden(settingsShow)
  hidden(homeShow)
})
lessons.addEventListener('click', () => {
  lessonsShow.classList.toggle('hidden')
  hidden(homeShow)
  hidden(settingsShow)
  hidden(schoolShow)
})
settings.addEventListener('click', () => {
  settingsShow.classList.toggle('hidden')
  hidden(lessonsShow)
  hidden(homeShow)
  hidden(schoolShow)
})
