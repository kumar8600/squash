#include "transform.h"

Transform::Transform(const glm::vec3& position, const glm::quat& rotation)
    : position_(position), rotation_(rotation) {}
