#pragma once

#include "Core.h"
namespace Nova {
	class NOVA_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// Should be defined in client
	Application* CreateApplication();
}
