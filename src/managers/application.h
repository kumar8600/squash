#ifndef APPLICATION_H
#define APPLICATION_H

#include <entityx/entityx.h>

class Application : public entityx::EntityX {
 public:
  Application();

  void update(double dt);
};

#endif  // APPLICATION_H
