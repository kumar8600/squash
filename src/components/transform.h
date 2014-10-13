#ifndef TRANSFORM_H
#define TRANSFORM_H

#include <entityx/entityx.h>
#include <glm/glm.hpp>
#include <glm/gtc/quaternion.hpp>

struct Transform : entityx::Component<Transform> {
  Transform(const glm::vec3& position, const glm::quat& rotation);

  glm::vec3 position_;
  glm::quat rotation_;
};

#endif  // TRANSFORM_H
