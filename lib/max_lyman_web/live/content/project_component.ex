defmodule MaxLymanWeb.Content.ProjectComponent do
  use MaxLymanWeb, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <div class="flex flex-col justify-between md:flex-row">
        <!-- temp space to be filled with a strava read out? or something i havent decided yet-->
        <!-- could try to have a feed of my strava routes/ workouts that updates in real time that would be cool -->
        <%!-- https://www.strava.com/settings/api --%>
        <div class="flex-none">
          <div class="pl-80">TEXT TEXT TEXT</div>
        </div>
        <div class="bg-white h-224 w-1/3 min-w-80 rounded-xl flex items-center flex-initial">
          TEMP
        </div>
      </div>
    </div>
    """
  end

end
