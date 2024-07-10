defmodule MaxLymanWeb.MasterLive do
  use MaxLymanWeb, :live_view

  def render(assigns) do
    ~H"""
      <div>
        <%!-- <.live_component module={MaxLymanWeb.Landing.LandingPage} id="landing-page"/> --%>
        <.live_component module={MaxLymanWeb.Content.HeadshotPage} id="headshot-page"/>
        <.live_component module={MaxLymanWeb.Content.ProjectComponent} id="project-component"/>
        <.live_component module={MaxLymanWeb.AwsView.HowItsDeployed} id="how-its-deployed"/>
      </div>
    """
  end

end
