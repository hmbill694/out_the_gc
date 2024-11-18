/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{gleam,js}"],
  theme: {
    extend: {}
  },
  plugins: [require("daisyui")]
};