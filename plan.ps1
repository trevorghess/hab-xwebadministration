
$pkg_name="xwebadministration"
$pkg_origin="th_demo"
$pkg_version="2.7.0.0"
$pkg_license=('MIT')
$pkg_upstream_url="https://github.com/PowerShell/xWebAdministration"
$pkg_description="The xWebAdministration module contains the xIISModule, xIISLogging, xWebAppPool, xWebsite, xWebApplication, xWebVirtualDirectory, xSSLSettings, xWebConfigKeyValue, xWebConfigProperty, xWebConfigPropertyCollection and WebApplicationHandler DSC resources for creating and configuring various IIS artifacts."
$pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
$pkg_source="https://www.powershellgallery.com/api/v2/package/xWebAdministration/${pkg_version}"
$pkg_shasum=""
$pkg_bin_dirs=@("bin")
$pkg_build_deps=@("core/nuget")

function Invoke-Unpack { 
    New-Item -ItemType Directory -Name output
    $nugetPath = Get-HabPackagePath nuget
    "$nugetPath/nuget.exe" install xWebAdministration -Source $HAB_CACHE_SRC_PATH -OutputDirectory $HAB_CACHE_SRC_PATH/output
}

function Invoke-Install {
  Copy-Item "$HAB_CACHE_SRC_PATH/output" "$pkg_prefix/bin" -Force
}