from PIL import Image, ExifTags
import os

print("""
A note to myself :
This script reduces the image quality in a good way 
but the orientation is changed automatically
so I need to chnage the orientation manually
as a post fix.
""")

# Set the path to your images directory
directory_path = 'img/'
compression_quality = 15  # Quality level (1-100) for JPEG compression; lower = smaller file size

def compress_images(directory, quality):
    # Iterate over each file in the directory
    for filename in os.listdir(directory):
        file_path = os.path.join(directory, filename)
        
        # Only process if it is a file and an image format
        if os.path.isfile(file_path) and filename.lower().endswith(('.png', '.jpg', '.jpeg')):
            try:
                with Image.open(file_path) as img:
                    # Remove EXIF orientation to avoid auto-rotate
                    if hasattr(img, '_getexif'):  # Check if the image has EXIF data
                        exif_data = img._getexif()
                        if exif_data is not None:
                            exif_data = {
                                ExifTags.TAGS.get(tag, tag): value
                                for tag, value in exif_data.items()
                            }
                            if 'Orientation' in exif_data:
                                del exif_data['Orientation']  # Remove Orientation tag

                    # Compress and save the image with optimized settings
                    if filename.lower().endswith(('.jpg', '.jpeg')):
                        img.save(file_path, "JPEG", quality=quality, optimize=True)
                    elif filename.lower().endswith('.png'):
                        img.save(file_path, "PNG", optimize=True)
                    print(f"Compressed and saved: {filename}")
            except Exception as e:
                print(f"Could not process {filename}: {e}")

# Run the compression function
compress_images(directory_path, compression_quality)

