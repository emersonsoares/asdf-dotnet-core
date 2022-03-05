function asdf_update_dotnet_home --on-event fish_prompt
  set --local dotnet_path (asdf which dotnet)
  if test -n "$dotnet_path"
    set --local full_path (realpath "$dotnet_path")
    set -gx DOTNET_ROOT (dirname "$full_path")
  end
end
