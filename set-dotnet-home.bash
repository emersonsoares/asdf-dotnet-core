asdf_update_dotnet_home() {
  local dotnet_path
  dotnet_path="$(asdf which dotnet 2> /dev/null)"
  if [[ -n "${dotnet_path}" ]]; then
    export DOTNET_ROOT="$(dirname "$(realpath "${dotnet_path}")")"
    DOTNET_VERSION="$(dotnet --version)"
    export MSBuildSDKsPath="$DOTNET_ROOT/sdk/$DOTNET_VERSION/Sdks"
  fi
}

prompt_command() {
  asdf_update_dotnet_home
}

export PROMPT_COMMAND="${PROMPT_COMMAND:+${PROMPT_COMMAND} prompt_command}"
export PROMPT_COMMAND="${PROMPT_COMMAND:-prompt_command}"
