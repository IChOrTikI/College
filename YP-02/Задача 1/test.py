from PIL import Image


image = Image.open('task2.bmp')


image = image.convert('RGB')


black_pixel_count = 0
another_pixel_count = 0


for x in range(image.width):
    for y in range(image.height):
        r, g, b = image.getpixel((x, y))

        if r == 0 and g == 0 and b == 0:
            black_pixel_count += 1
        else:
            another_pixel_count += 1


print(f'Количество черных пикселей: {black_pixel_count}')
print(f'Количество других пикселей: {another_pixel_count}')
print(f'Всего: ', black_pixel_count + another_pixel_count)
print(f'{round(black_pixel_count / 400)}')
