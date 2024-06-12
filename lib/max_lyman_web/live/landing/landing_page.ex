defmodule MaxLymanWeb.Landing.LandingPage do
  use MaxLymanWeb, :live_component
  require Logger

  def mount(socket) do
    {:ok, socket}
  end


  def render(assigns) do
    ~H"""
    <div
        class="bg-pallet-navy relative"
        style="height: 100vh;">

        <div class="flex flex-col justify-center items-center h-full">
          <a href="/" class="flex flex-col justify-center relative">
            <.live_component
              module={MaxLymanWeb.Landing.BikeAnimation}
              id="bike-animation"
              direction="right-to-left"
              animation_number="1"
              scroll={true}
            />
            <h1 class="text-9xl text-white bebas-neue-regular">
              MAX LYMAN
            </h1>
          </a>
          <div class="flex flex-row justify-center">
            <h2 class="italic text-3xl text-white font-sans">
               Software Engineer
            </h2>
            <h2 class="text-3xl text-white font-sans px-6"> | </h2>
            <h2 class="italic text-3xl text-white font-sa">
              Brooklyn, NY
            </h2>
          </div>
          <div class="flex flex-row justify-center space-x-24 items-center pt-2">
            <a href="https://github.com/MaxLyman">
              <img
                class="h-12 w-12"
                src="/images/github-mark-white.png"
                alt="github"
              />
            </a>
            <a href="https://www.linkedin.com/in/maxlyman123/">
              <img
                class="h-12 w-12"
                src="/images/linkedin-logo-white.png"
                alt="linkedin"
              />
            </a>
          </div>
        </div>
    </div>
    """
  end

end
