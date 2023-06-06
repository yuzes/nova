#pragma once


#ifdef NV_PLATFORM_WINDOWS

extern Nova::Application* Nova::CreateApplication();

int main(int argc, char** argv)
{
	printf("Nova Engine, Æô¶¯!");
	auto app = Nova::CreateApplication();
	app->Run();
	delete app;

}
#else
	#error Nova only supports windows
#endif