defmodule CareerAILeadershipEliteBackend.Application do
  use Application

  @impl true
  def start(_type, _args) do
    port =
      case System.get_env("CAREER_AI_LEADERSHIP_ELITE_BACKEND_PORT") do
        nil -> 45_900
        value -> String.to_integer(value)
      end

    children = [
      {CareerAILeadershipEliteBackend.HealthServer, port}
    ]

    opts = [strategy: :one_for_one, name: CareerAILeadershipEliteBackend.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
