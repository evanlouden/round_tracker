module.exports = {
  mode: 'jit',
  purge: [
    './app/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/javascripts/**/*.js',
    './config/initializers/simple_form.rb'
  ],
  darkMode: false, // or 'media' or 'class'
  plugins: [],
}
