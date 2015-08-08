SAC2C = sac2c -mt

all: libriplMod.a libripl_noinlMod.a

libriplMod.a: libgreyscaleMod.a librgbMod.a libimage_greyscaleMod.a libimage_rgbMod.a libpointsMod.a
libripl_noinlMod.a: libgreyscale_noinlMod.a librgb_noinlMod.a libimage_greyscale_noinlMod.a libimage_rgb_noinlMod.a libpoints_noinlMod.a libgreyscaleMod.a librgbMod.a

libgreyscale_noinlMod.a: libgreyscaleMod.a
librgb_noinlMod.a: librgbMod.a

libimage_greyscaleMod.a: libgreyscaleMod.a librgbMod.a libpointsMod.a
libimage_rgbMod.a: librgbMod.a libpointsMod.a
image_greyscale.sac: libgreyscaleMod.a librgbMod.a libpointsMod.a
image_rgb.sac: librgbMod.a libpointsMod.a

libimage_greyscale_noinlMod.a: libgreyscaleMod.a libpoints_noinlMod.a librgbMod.a
libimage_rgb_noinlMod.a: librgbMod.a libpointsMod.a
image_greyscale_noinl.sac: libgreyscaleMod.a libpointsMod.a librgbMod.a
image_rgb_noinl.sac: librgbMod.a libpointsMod.a librgbMod.a

lib%_noinlMod.a: %_noinl.sac
	$(SAC2C) $<

lib%_noinlMod.a: %.sac
	$(SAC2C) $<

lib%Mod.a: %.sac
	$(SAC2C) -DINLINE $<

image_greyscale.sac: image.mac image.xsac 
	$(SAC2C) -DINLINE -DGREYSCALE -bscp image.xsac > image_greyscale.sac
	sed -e "s/; ,/;/g" image_greyscale.sac > image_tmp.sac
	mv image_tmp.sac image_greyscale.sac

image_greyscale_noinl.sac: image.mac image.xsac
	$(SAC2C) -DGREYSCALE -bscp image.xsac > image_greyscale_noinl.sac
	sed -e "s/; ,/;/g" image_greyscale_noinl.sac > image_noinl_tmp.sac
	mv image_noinl_tmp.sac image_greyscale_noinl.sac

image_rgb.sac: image.mac image.xsac 
	$(SAC2C) -DINLINE -DRGB -bscp image.xsac > image_rgb.sac
	sed -e "s/; ,/;/g" image_rgb.sac > image_rgb_tmp.sac
	mv image_rgb_tmp.sac image_rgb.sac

image_rgb_noinl.sac: image.mac image.xsac
	$(SAC2C) -DRGB -bscp image.xsac > image_rgb_noinl.sac
	sed -e "s/; ,/;/g" image_rgb_noinl.sac > image_rgb_noinl_tmp.sac
	mv image_rgb_noinl_tmp.sac image_rgb_noinl.sac

clean:
	rm -f lib* image_greyscale.sac image_greyscale_noinl.sac image_rgb.sac image_rgb_noinl.sac
