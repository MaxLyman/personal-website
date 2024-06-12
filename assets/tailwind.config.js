// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

const plugin = require("tailwindcss/plugin")
const fs = require("fs")
const path = require("path")

module.exports = {
  content: [
    "./js/**/*.js",
    "../lib/max_lyman_web.ex",
    "../lib/max_lyman_web/**/*.*ex"
  ],
  theme: {
    extend: {
      colors: {
        'pallet-navy': "#0C4160",
        'pallet-tan': "#AEA885",
        'pallet-green': "#545B5C",
        'pallet-grey': "#C1C3BE",
        'pallet-light-grey': "#E2E6E8",
        
      },
      maxWidth: {
        '120' : '30rem',
        '128' : '32rem',
        '144' : '36rem',
        '160' : '40rem',
        '176' : '44rem',
        '192' : '48rem',
        '208' : '52rem',
        '224' : '56rem',
        '240' : '60rem',
        '256' : '64rem',
        '272' : '68rem',
        '288' : '72rem',
        '304' : '76rem',
        '310' : '78rem',
        '320' : '80rem',
        '336' : '84rem',
        '352' : '88rem',
        '368' : '92rem',
      },
      width: {
        '120' : '30rem',
        '128' : '32rem',
        '144' : '36rem',
        '160' : '40rem',
        '176' : '44rem',
        '192' : '48rem',
        '208' : '52rem',
        '224' : '56rem',
        '240' : '60rem',
        '256' : '64rem',
        '272' : '68rem',
        '288' : '72rem',
        '304' : '76rem',
      },
      height: {
        '120' : '30rem',
        '128' : '32rem',
        '144' : '36rem',
        '160' : '40rem',
        '176' : '44rem',
        '192' : '48rem',
        '208' : '52rem',
        '224' : '56rem',
        '240' : '60rem',
        '256' : '64rem',
        '272' : '68rem',
        '288' : '72rem',
        '304' : '76rem',
        "1/10": "10%",
        "9/10": "90%",
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    // Allows prefixing tailwind classes with LiveView classes to add rules
    // only when LiveView classes are applied, for example:
    //
    //     <div class="phx-click-loading:animate-ping">
    //
    plugin(({addVariant}) => addVariant("phx-no-feedback", [".phx-no-feedback&", ".phx-no-feedback &"])),
    plugin(({addVariant}) => addVariant("phx-click-loading", [".phx-click-loading&", ".phx-click-loading &"])),
    plugin(({addVariant}) => addVariant("phx-submit-loading", [".phx-submit-loading&", ".phx-submit-loading &"])),
    plugin(({addVariant}) => addVariant("phx-change-loading", [".phx-change-loading&", ".phx-change-loading &"])),

    // Embeds Heroicons (https://heroicons.com) into your app.css bundle
    // See your `CoreComponents.icon/1` for more information.
    //
    plugin(function({matchComponents, theme}) {
      let iconsDir = path.join(__dirname, "../deps/heroicons/optimized")
      let values = {}
      let icons = [
        ["", "/24/outline"],
        ["-solid", "/24/solid"],
        ["-mini", "/20/solid"],
        ["-micro", "/16/solid"]
      ]
      icons.forEach(([suffix, dir]) => {
        fs.readdirSync(path.join(iconsDir, dir)).forEach(file => {
          let name = path.basename(file, ".svg") + suffix
          values[name] = {name, fullPath: path.join(iconsDir, dir, file)}
        })
      })
      matchComponents({
        "hero": ({name, fullPath}) => {
          let content = fs.readFileSync(fullPath).toString().replace(/\r?\n|\r/g, "")
          let size = theme("spacing.6")
          if (name.endsWith("-mini")) {
            size = theme("spacing.5")
          } else if (name.endsWith("-micro")) {
            size = theme("spacing.4")
          }
          return {
            [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
            "-webkit-mask": `var(--hero-${name})`,
            "mask": `var(--hero-${name})`,
            "mask-repeat": "no-repeat",
            "background-color": "currentColor",
            "vertical-align": "middle",
            "display": "inline-block",
            "width": size,
            "height": size
          }
        }
      }, {values})
    })
  ]
}
