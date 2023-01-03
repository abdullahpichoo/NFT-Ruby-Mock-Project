const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
  ],
  theme: {
    extend: {
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
      keyframes: {
        "fade-in": {
          "0%": {
            opacity: "0",
            transform: "translateY(-20px)",
          },
          "100%": {
            opacity: "1",
            transform: "translateY(0)",
          },
        },
        "fade-out": {
          "0%": {
            opacity: "1",
            transform: "translateY(0)",
          },
          "100%": {
            opacity: "0",
            transform: "translateY(-20px)",
            display: "none",
          },
        },
      },
      animation: {
        "fade-in": "fade-in 0.5s ease-in",
        "fade-out": "fade-out 0.5s ease-out",
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
  ],
};
