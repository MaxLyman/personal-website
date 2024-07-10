defmodule MaxLymanWeb.Content.ProjectComponent do
  use MaxLymanWeb, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <div class="flex flex-col justify-between px-16 pb-24 max-w-1/2 ">
        <!-- temp space to be filled with a strava read out? or something i havent decided yet-->
        <!-- could try to have a feed of my strava routes/ workouts that updates in real time that would be cool -->
        <%!-- https://www.strava.com/settings/api --%>
        <div class="flex-none">
          <div class="pb-5">
            <h1 class="text-4xl font-bold text-white">Projects:</h1>
          </div>
            <ul>
                <.live_component
                  module={MaxLymanWeb.ProjectLinkComponent}
                  id="aws-tab-sorter"
                  title="AWS Tab Sorter"
                  description="Project to make a Chrome Extension that sorts AWS Console tabs via services or category."
                  image="/images/github-mark-white.png"
                  link="https://github.com/MaxLyman/aws-tab-sorter"
                />
                <.live_component
                  module={MaxLymanWeb.ProjectLinkComponent}
                  id="max-lyman-web"
                  title="Max Lyman Web"
                  description="This website! Built with Phoenix LiveView and Tailwind CSS deployed on AWS."
                  image="/images/github-mark-white.png"
                  link="https://github.com/MaxLyman/personal-website"
                />
            </ul>
        </div>
        <div class="flex-none">
          <div class="pb-5">
            <h1 class="text-3xl font-bold text-white">Other Relevent Links:</h1>
          </div>
          <ul>
              <.live_component
                module={MaxLymanWeb.ProjectLinkComponent}
                id="chrome-link"
                title="Published AWS TAB Sorter Chrome Extension"
                description="Published Chrome Extension on the Chrome Web Store."
                image="/images/chrome-store-logo.png"
                link="https://chromewebstore.google.com/detail/aws-tab-sorter/hkkanhfpnmicicdflacapdpdlpiklmjn?authuser=0&hl=en"
              />
          </ul>
        </div>
      </div>
    </div>
    """
  end

end
