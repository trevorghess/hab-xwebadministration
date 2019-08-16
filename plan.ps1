$pkg_name="xWebAdministration"
$pkg_origin="th_demo"
$pkg_version="2.7.0.0"
$pkg_short_version="2.7.0"
$pkg_license=('MIT')
$pkg_upstream_url="https://github.com/PowerShell/xWebAdministration"
$pkg_description="The xWebAdministration module contains the xIISModule, xIISLogging, xWebAppPool, xWebsite, xWebApplication, xWebVirtualDirectory, xSSLSettings, xWebConfigKeyValue, xWebConfigProperty, xWebConfigPropertyCollection and WebApplicationHandler DSC resources for creating and configuring various IIS artifacts."
$pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
$pkg_source="https://www.powershellgallery.com/api/v2/package/xWebAdministration/${pkg_version}"
$pkg_shasum="46dda7d823c5260b79483ef4201a970557822c1ed6e1ce88e6144d790a1e4737"
$pkg_filename="$pkg_name.$pkg_short_version.nupkg"
$pkg_bin_dirs=@("bin")
$pkg_build_deps=@("core/nuget")

function Invoke-Unpack { 
  New-Item -ItemType Directory -Path $HAB_CACHE_SRC_PATH/output -Force
  $nugetPath = Get-HabPackagePath nuget
  Write-Host "$nugetPath/bin/nuget.exe"
  Write-Host "$HAB_CACHE_SRC_PATH"
  Start-Process "$nugetPath/bin/nuget.exe" -Wait -ArgumentList "install xWebAdministration -Source $HAB_CACHE_SRC_PATH -OutputDirectory $HAB_CACHE_SRC_PATH/output"
}

function Invoke-Install {
  Copy-Item "$HAB_CACHE_SRC_PATH/output/$pkg_name.$pkg_short_version/*" "$pkg_prefix/bin" -Force -Recurse
}
