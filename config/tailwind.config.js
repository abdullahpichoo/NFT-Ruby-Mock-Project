const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
  ],
  theme: {
    colors: {
      bgBlack: "#100E10",
      grey1: "#65686A",
      grey2: "#929699",
      stdWhite: "#D7D3D6",
      stdPink: "#DF3C6C",
      stdCyan: "#2CD4DF",
    },
    fontFamily: {
      poppins: ["Poppins"],
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
  ],
};
