function asdf_update_dotnet_home --on-event fish_prompt
  set --local dotnet_path (asdf which dotnet)
  if test -n "$dotnet_path"
    set --local dotnet_version (dotnet --version)
    set --local full_path (realpath "$dotnet_path")
    set -gx DOTNET_ROOT (dirname "$full_path")
    set -gx MSBuildSDKsPath (dirname "$full_path/sdk/$dotnet_version/Sdks")
  end
end
