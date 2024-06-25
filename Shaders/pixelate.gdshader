shader_type canvas_item;

// Variables in Godot shader strats with "uniform"
// This is a two-dimensional vector: vec2
// This variable tells us how many pixels we want there to be in our pixel art.
// I give it a default of 64x64
uniform vec2 pixel_count = vec2(64.0);

void fragment()
{
	// UV is a relative 2D coordinate inside a texture. It tells every pixel which color it should display.
	// "UV" is the original, unmodified UV parameter provided by Godot. We want to modify it, so we created our own "uv".
	// Upscale "uv" by pixel count, floor the result, then downscale it by pixel count.
	// This is a very common technique when making pixel shaders.
	vec2 uv = UV;
	uv *= pixel_count;
	uv = floor(uv);
	uv = uv / pixel_count;
	
	// COLOR parameter is provided by Godot. If we modify it, we control what color is displayed by each pixel.
	// We use a "texture" function to sample colors from "TEXTURE" parameter.
	// "TEXTURE" is another parameter provided by Godot. In this case, it points to our SubViewport texture.
	// We sample "TEXTURE" using the modified "uv", so that the sampled color is pixel art.
	COLOR = texture(TEXTURE, uv);
}
