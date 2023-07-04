workspace "Nova"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Nova"
	location "Nova"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/3rdParty/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"NV_PLATFORM_WINDOWS",
			"NV_BUILD_DLL",
			"_WINDLL"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}
	
	filter "configurations:debug"
		defines "NV_DEBUG"
		symbols "On"

	filter "configurations:releaase"
		defines "NV_RELEASE"
		optimize "On"
	
	filter "configurations:Dist"
		defines "NV_DIST"
		optimize "On"


project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Nova/3rdParty/spdlog/include",
		"Nova/src"
	}

	links
	{
		"Nova"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"NV_PLATFORM_WINDOWS"
		}
	
	filter "configurations:debug"
		defines "NV_DEBUG"
		symbols "On"

	filter "configurations:releaase"
		defines "NV_RELEASE"
		optimize "On"
	
	filter "configurations:Dist"
		defines "NV_DIST"
		optimize "On"