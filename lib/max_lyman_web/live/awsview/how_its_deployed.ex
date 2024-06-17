defmodule MaxLymanWeb.AwsView.HowItsDeployed do
  use MaxLymanWeb, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col items-center text-extra-large-style h-lvh">
    <!-- How it's deployed will be an interactive graph of how i deployed this project on aws-->
    <!-- I want it to look like those diagrams that show the structure of an aws project -->
    COMING SOON

    </div>

    """
  end
end
