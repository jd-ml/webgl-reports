// GLSL VERTEX SHADER

uniform mat4 modelview, projection;
uniform mat4 identity;

// C1: DECLARE ROTATION AND TRANSLATION HERE
uniform mat4 rotation;
uniform mat4 translation;
uniform mat4 translation_inv;

uniform float alpha;
uniform bool use_colour;

attribute vec4 vertex;
attribute vec4 colour;

varying vec4 colour_var;

void main()
{
    // C1: DEFINE INVERSE TRANSLATION MATRIX HERE
    // mat4 translation_inv = translation;

    // convert to homogeneous coordinates
    vec4 point = vec4(vertex.x, vertex.y, vertex.z, 1.0);

    // C1: USE ROTATION AND TRANSLATION MATRICES HERE
    gl_Position = translation * translation_inv * projection * modelview * rotation * point;
    
    // transform and then project -- note that division is performed later
    // gl_Position = projection * modelview * point;

    if(use_colour) {
        // from attribute array
        colour_var = colour;
    }
    else {
        // monchrome controlled by uniform rgba
        colour_var = vec4(0.5, 0.5, 0.5, alpha);
    }
}