workspace "DrawAOXYS"
	architecture "x64"
	startproject "DrawAOXYS"

	configurations{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["SFML"] = "%{wks.location}/DrawAOXYS/vendor/SFML/include"
	
project "DrawAOXYS"
	location "DrawAOXYS"

	kind "ConsoleApp"
	language "C++"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	defines "SFML_STATIC"

	files{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.hpp",
		"%{prj.name}/src/**.cpp"
	}

	includedirs{
		"%{prj.name}/src",
		"%{IncludeDir.SFML}"
	}

	libdirs "%{wks.location}/%{prj.name}/vendor/SFML/lib" 

	links{
		"flac",
		"freetype",
		"ogg",
		"openal32",
		"sfml-audio-s-d",
		"sfml-graphics-s-d",
		"sfml-network-s-d",
		"sfml-system-s-d",
		"sfml-window-s-d",
		"vorbis",
		"vorbisenc",
		"vorbisfile",
		"opengl32",
		"winmm",
		"gdi32",
		"ws2_32"
	}

	filter "system:windows"
		cppdialect "C++20"
		staticruntime "on"
		systemversion "latest"
		 
		defines{
			"PLATFORM_WINDOWS" 
		}

	filter "configurations:Debug"
		defines{
			"DEBUG",
			"ENABLE_ASSERTS"
		}
		runtime "Debug"
		buildoptions "/MDd"
		symbols "on"

	filter "configurations:Release"
		defines "RELEASE"
		runtime "Release"
		buildoptions "/MD"
		optimize "on"

	filter "configurations:Dist"
		defines "DIST"
		runtime "Release"
		buildoptions "/MD"
		optimize "on"
