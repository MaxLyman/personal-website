defmodule MaxLymanWeb.Headshot.HeadshotPage do
  use MaxLymanWeb, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
      <div class="px-16 pl-16 h-lvh flex flex-col space-y-24">
        <div class="bg-white h-120 max-w-352 rounded-xl flex items-center">
          <div class="flex flex-row px-10 divide-x-8 divide-pallet-green">
            <div class="w-120 flex-none pr-10">
              <img
                class="rounded-full border-8"
                src="/images/profile_pic.png"
                alt="headshot"/>
            </div>
            <div class="flex-1 pl-10 pt-5">
              <div class="flex-col">
                <div class="text-4xl font-bold bebas-neue-regular">
                  About Me
                </div>
                <div>
                  <p class="text-2xl font-semibold font-sans ">
                    TEMP TEXT
                  </p>
                </div>
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
