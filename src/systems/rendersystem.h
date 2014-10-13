#ifndef RENDERSYSTEM_H
#define RENDERSYSTEM_H

#include <entityx/entityx.h>

class RenderSystem : public entityx::System<RenderSystem> {
 public:
  RenderSystem();

  void update(entityx::EntityManager &es, entityx::EventManager &events,
              double dt) override;
};

#endif  // RENDERSYSTEM_H
