defmodule MaxLymanWeb.MasterLive do
  use MaxLymanWeb, :live_view

  def render(assigns) do
    ~H"""
      <div>
        <.live_component module={MaxLymanWeb.Landing.LandingPage} id="landing-page"/>
        <.live_component module={MaxLymanWeb.Headshot.HeadshotPage} id="headshot-page"/>
      </div>
    """
  end

end
