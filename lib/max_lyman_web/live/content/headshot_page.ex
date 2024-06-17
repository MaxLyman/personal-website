defmodule MaxLymanWeb.Content.HeadshotPage do
  use MaxLymanWeb, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
      <div class="px-16 h-2lvh space-y-24">
        <div class="flex flex-col xl:flex-row items-center sm:mx-auto xl:mx-0 xl:space-x-16 xl:space-y-0 space-y-16">
          <div name="headshot" class="bg-white max-w-2/3 min-w-120 rounded-xl flex flex-col 2xl:flex-row items-center divider-style-x">
            <div class="px-10">
              <div class="w-120 py-10">
                <img
                  class="rounded-full border-8"
                  src="/images/profile_pic.png"
                  alt="headshot"/>
              </div>
              </div>
              <div class="flex-1 pl-10 pt-5">
                <div class="flex-col">
                  <div class="text-4xl font-bold bebas-neue-regular">
                    About Me
                  </div>
                  <div>
                    <p class="text-2xl font-medium font-sans pr-10">
                      Hello! I'm Max Lyman a recent graduate from the University of Wisconsin Madison with a B.S. in Computer Science. I'm a software engineer with a passion for cycling and the outdoors.
                      I'm always looking for new opportunities to learn and grow as a developer. My interests include web design, cyber security, DevOps, and cloud computing.
                    </p>
                  </div>
                </div>
            </div>
          </div>
          <div name="course-work" class="bg-white flex-grow max-w-1/3 min-w-120 rounded-xl pl-10">
            <div class="h-144 pt-10 mx-auto">
              <div class="text-4xl font-bold bebas-neue-regular">
                Relevent Coursework 🎒
              </div>
              <div class="text-2xl font-medium font-sans pr-10 pt-5">

              <ul class="list-inside list-disc	">
                2021
                <li> Data Visualization </li>
                <li> Data Modeling </li>
              </ul>
              <ul class="list-inside list-disc	">
                  2022
                  <li> Algorithms </li>
                  <li> Data Ethics and Policy </li>
                  <li> Software Engineering </li>
                  <li> Data Science Programming </li>
              </ul>
              <ul class="list-inside list-disc	">
                  2023
                  <li> Human Computer Interaction </li>
                  <li> Big Data Systems </li>
              </ul>

              </div>
            </div>
          </div>
        </div>
        <div>
          <.live_component
            module={MaxLymanWeb.Landing.BikeAnimation}
            id="headshot-bike-animation"
            direction="left-to-right"
            animation_number="2"
            scroll={false}
          />
        </div>
      </div>
    """
  end
end
