Return-Path: <linux-hwmon+bounces-2079-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FE68BEE72
	for <lists+linux-hwmon@lfdr.de>; Tue,  7 May 2024 22:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC3ED2843C9
	for <lists+linux-hwmon@lfdr.de>; Tue,  7 May 2024 20:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3925FDDB;
	Tue,  7 May 2024 20:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YLopII3I"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1DC58AB8
	for <linux-hwmon@vger.kernel.org>; Tue,  7 May 2024 20:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715115359; cv=none; b=nxuvix7ZkZTXz1pOaBN8Bnmo8PkA2eyD5M3GfvFvrW6N86purXV09x1XWD8yBx+tyEEdswjrDKG1JRLm9jzatooX+vLbkSOO+I59njGPTkgIqrWdeQfsPjUSIaDQgN+O575X2GVqERbxIWB5KZJXRIvRo1hj2oBXwh2imn4w7V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715115359; c=relaxed/simple;
	bh=tqC0f6QiCD2ZN/kLXJjA29ZSVh++2S8UZYYewSys++8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=glQtUsDMwKd4twKrUb/S+XC+GTfrQGNPjwkpY7iiGDbz1K3A6SPxmvfVHr4CKzhir3pFrrKBXtYRrcXg+NLi0Uq5AmZkhY5/TajIWZwQlsWgmR9tYfR0hWXPS7kW8wsQzFMTP6cjySptmkwszAIYlui5eaNWgow/VUEBN2S4MJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YLopII3I; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ee5f3123d8so13035ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 07 May 2024 13:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715115357; x=1715720157; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHb8SsUUiqpjmjDEivIYFRGaYeBJLOo1gMZGxn8pJq4=;
        b=YLopII3If5YURW99/E7WIG5E17lCqMRgnG6c7tPHfAPdxkU+zVHEwYLAXcToBo4VoF
         XDb3JtHn+61J9KB6M2nVJOSGwObaQYyn7aMhS3naCrg9C3mWzB1GD4R+3ROzviWUUej/
         yf7J/ZA8qqmS2zEFmcEzKV0XzKUQ4Kp6+PHjktpCgR6JJg+KUanvriDKcAQNFU3y7CzA
         lzrkZ07MeKKYwbe3+gtSfYTUSZ5kCY1XDQmqkl2KBcNB4l2NOGsW/vX+GlhkupG3OEBb
         CUvMbzq1gzc/5awF1kA3TYOi3+MbbqkhEBO/W1uUtmXcf4Nw+oooRv0uieSk/7CsDJA0
         XaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715115357; x=1715720157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHb8SsUUiqpjmjDEivIYFRGaYeBJLOo1gMZGxn8pJq4=;
        b=S01bf4QlyAbjzu9+YJWtK833SpSJrjAduF49Xjx0NSzuOKrrbVV+Tb27/wYLK9ryTD
         KwJL8KyY7qXnOM+ZQLyMfMPqENA0088KJFietfWEqJtxMWp4VQYA/zdBiONd45ezQJG5
         gUQzUPC0FzoWdQkqUIeMdaLfiESXOmziyoov4cx48X+wtSBh5e6WMsJp8Uo2ED70E7ug
         b9IsstcroIs6Woz9JmEf+VHA2jJfJ2IME7i9PFg+Dxzd8yAx97INLYXyj/gpawN5S5Lt
         IqT+/LRoLcWk0rvyOEGXm9jgKusaoTiYB54CA6QU0Cy/d5U4G8azq/nDG54vPsu+v6TQ
         FamQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZqxHE4AX3rsWPNMAost6vqmmDo4XR9TTmjG/RAIyYeSlRZMQ5yvpzRjd/d2g3EWKxtnqj2NcKY8zpNp6jO9Yz1rSQxdCl7iG7MaI=
X-Gm-Message-State: AOJu0YzQ73irxyJFzZHdwmyZ1DsC0ICD6HRVOJJRgvzEdXh1hrefezeZ
	kiTj/TV5yD8D8q6+bGfMUV3oLgQJW4GfI2t/5S0nQAskUpdu2rmTOkcffrR2YtW/4bWwBo1Nj7z
	A77Vcx68etEOQYjQ8uL0VpnnCD2Tbq+dGnqoF8+O8LjaMch6f0Q==
X-Google-Smtp-Source: AGHT+IFld3sKUbXCVJBNfRmI13WmxocS1q3dOzotXK7Y915R38L5Gmva/6XwjfYmrSoxdKneftsVpNrTUoEQyUaFURs=
X-Received: by 2002:a17:902:d54e:b0:1eb:1d30:64c3 with SMTP id
 d9443c01a7336-1eebe4ab458mr82255ad.23.1715115356730; Tue, 07 May 2024
 13:55:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507-cros_ec-hwmon-v2-0-1222c5fca0f7@weissschuh.net> <20240507-cros_ec-hwmon-v2-1-1222c5fca0f7@weissschuh.net>
In-Reply-To: <20240507-cros_ec-hwmon-v2-1-1222c5fca0f7@weissschuh.net>
From: Guenter Roeck <groeck@google.com>
Date: Tue, 7 May 2024 14:55:44 -0600
Message-ID: <CABXOdTcabi6ab9FnfvR+3-q0sKQuk_sewD8ZT=80j5Ou+bHeKQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hwmon: add ChromeOS EC driver
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Benson Leung <bleung@chromium.org>, Lee Jones <lee@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Dustin Howett <dustin@howett.net>, Mario Limonciello <mario.limonciello@amd.com>, 
	Moritz Fischer <mdf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 7, 2024 at 10:29=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> The ChromeOS Embedded Controller exposes fan speed and temperature
> readings.
> Expose this data through the hwmon subsystem.
>
> The driver is designed to be probed via the cros_ec mfd device.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  Documentation/hwmon/cros_ec_hwmon.rst |  26 ++++
>  Documentation/hwmon/index.rst         |   1 +
>  MAINTAINERS                           |   8 +
>  drivers/hwmon/Kconfig                 |  11 ++
>  drivers/hwmon/Makefile                |   1 +
>  drivers/hwmon/cros_ec_hwmon.c         | 269 ++++++++++++++++++++++++++++=
++++++
>  6 files changed, 316 insertions(+)
>
> diff --git a/Documentation/hwmon/cros_ec_hwmon.rst b/Documentation/hwmon/=
cros_ec_hwmon.rst
> new file mode 100644
> index 000000000000..aeb88c79d11b
> --- /dev/null
> +++ b/Documentation/hwmon/cros_ec_hwmon.rst
> @@ -0,0 +1,26 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver cros_ec_hwmon
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +Supported chips:
> +
> +  * ChromeOS embedded controllers connected via LPC
> +
> +    Prefix: 'cros_ec'
> +
> +    Addresses scanned: -
> +
> +Author:
> +
> +  - Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> +
> +Description
> +-----------
> +
> +This driver implements support for hardware monitoring commands exposed =
by the
> +ChromeOS embedded controller used in Chromebooks and other devices.
> +
> +The channel labels exposed via hwmon are retrieved from the EC itself.
> +
> +Fan and temperature readings are supported.
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rs=
t
> index 1ca7a4fe1f8f..355a83e66928 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -57,6 +57,7 @@ Hardware Monitoring Kernel Drivers
>     coretemp
>     corsair-cpro
>     corsair-psu
> +   cros_ec_hwmon
>     da9052
>     da9055
>     dell-smm-hwmon
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c23fda1aa1f0..aa5689169eca 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4988,6 +4988,14 @@ S:       Maintained
>  F:     Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
>  F:     sound/soc/codecs/cros_ec_codec.*
>
> +CHROMEOS EC HARDWARE MONITORING
> +M:     Thomas Wei=C3=9Fschuh <thomas@weissschuh.net>
> +L:     chrome-platform@lists.linux.dev
> +L:     linux-hwmon@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/hwmon/chros_ec_hwmon.rst
> +F:     drivers/hwmon/cros_ec_hwmon.c
> +
>  CHROMEOS EC SUBDRIVERS
>  M:     Benson Leung <bleung@chromium.org>
>  R:     Guenter Roeck <groeck@chromium.org>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 83945397b6eb..c1284d42697f 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -506,6 +506,17 @@ config SENSORS_CORSAIR_PSU
>           This driver can also be built as a module. If so, the module
>           will be called corsair-psu.
>
> +config SENSORS_CROS_EC
> +       tristate "ChromeOS Embedded Controller sensors"
> +       depends on MFD_CROS_EC_DEV
> +       default MFD_CROS_EC_DEV
> +       help
> +         If you say yes here you get support for ChromeOS Embedded Contr=
oller
> +         sensors.
> +
> +         This driver can also be built as a module. If so, the module
> +         will be called cros_ec_hwmon.
> +
>  config SENSORS_DRIVETEMP
>         tristate "Hard disk drives with temperature sensors"
>         depends on SCSI && ATA
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 5c31808f6378..8519a6b36c00 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -64,6 +64,7 @@ obj-$(CONFIG_SENSORS_CHIPCAP2) +=3D chipcap2.o
>  obj-$(CONFIG_SENSORS_CORETEMP) +=3D coretemp.o
>  obj-$(CONFIG_SENSORS_CORSAIR_CPRO) +=3D corsair-cpro.o
>  obj-$(CONFIG_SENSORS_CORSAIR_PSU) +=3D corsair-psu.o
> +obj-$(CONFIG_SENSORS_CROS_EC)  +=3D cros_ec_hwmon.o
>  obj-$(CONFIG_SENSORS_DA9052_ADC)+=3D da9052-hwmon.o
>  obj-$(CONFIG_SENSORS_DA9055)+=3D da9055-hwmon.o
>  obj-$(CONFIG_SENSORS_DELL_SMM) +=3D dell-smm-hwmon.o
> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.=
c
> new file mode 100644
> index 000000000000..d59d39df2ac4
> --- /dev/null
> +++ b/drivers/hwmon/cros_ec_hwmon.c
> @@ -0,0 +1,269 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  ChromesOS EC driver for hwmon
> + *
> + *  Copyright (C) 2024 Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/hwmon.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/platform_data/cros_ec_commands.h>
> +#include <linux/platform_data/cros_ec_proto.h>
> +#include <linux/units.h>
> +
> +#define DRV_NAME       "cros-ec-hwmon"
> +
> +struct cros_ec_hwmon_priv {
> +       struct cros_ec_device *cros_ec;
> +       u8 thermal_version;
> +       const char *temp_sensor_names[EC_TEMP_SENSOR_ENTRIES + EC_TEMP_SE=
NSOR_B_ENTRIES];
> +};
> +
> +static int cros_ec_hwmon_read_fan_speed(struct cros_ec_device *cros_ec, =
u8 index, u16 *speed)
> +{
> +       u16 data;
> +       int ret;
> +
> +       ret =3D cros_ec->cmd_readmem(cros_ec, EC_MEMMAP_FAN + index * 2, =
2, &data);
> +       if (ret < 0)
> +               return ret;
> +
> +       data =3D le16_to_cpu(data);
> +
> +       if (data =3D=3D EC_FAN_SPEED_NOT_PRESENT)
> +               return -ENODEV;
> +
I don't have time for a full review right now, but this looks wrong:
If a fan is not present, its sysfs attribute should not be instantiated.
Returning -ENODEV here is most definitely wrong.

> +       *speed =3D data;
> +       return 0;
> +}
> +
> +static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 th=
ermal_version,
> +                                  u8 index, u8 *data)
> +{
> +       unsigned int offset;
> +       int ret;
> +
> +       if (index < EC_TEMP_SENSOR_ENTRIES)
> +               offset =3D EC_MEMMAP_TEMP_SENSOR + index;
> +       else
> +               offset =3D EC_MEMMAP_TEMP_SENSOR_B + index - EC_TEMP_SENS=
OR_ENTRIES;
> +
> +       ret =3D cros_ec->cmd_readmem(cros_ec, offset, 1, data);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (*data =3D=3D EC_TEMP_SENSOR_NOT_PRESENT ||
> +           *data =3D=3D EC_TEMP_SENSOR_ERROR ||
> +           *data =3D=3D EC_TEMP_SENSOR_NOT_POWERED ||
> +           *data =3D=3D EC_TEMP_SENSOR_NOT_CALIBRATED)
> +               return -ENODEV;
> +
Same as above.

Guenter

> +       return 0;
> +}
> +
> +static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_type=
s type,
> +                             u32 attr, int channel, long *val)
> +{
> +       struct cros_ec_hwmon_priv *priv =3D dev_get_drvdata(dev);
> +       int ret =3D -ENODATA;
> +       u16 speed;
> +       u8 temp;
> +
> +       if (type =3D=3D hwmon_fan) {
> +               ret =3D cros_ec_hwmon_read_fan_speed(priv->cros_ec, chann=
el, &speed);
> +               if (ret =3D=3D 0)
> +                       *val =3D speed;
> +       } else if (type =3D=3D hwmon_temp) {
> +               ret =3D cros_ec_hwmon_read_temp(priv->cros_ec, priv->ther=
mal_version, channel, &temp);
> +               if (ret =3D=3D 0)
> +                       *val =3D kelvin_to_millicelsius((((long)temp) + E=
C_TEMP_SENSOR_OFFSET));
> +       }
> +
> +       return ret;
> +}
> +
> +static int cros_ec_hwmon_get_temp_sensor_info(struct cros_ec_device *cro=
s_ec, u8 id,
> +                                             struct ec_response_temp_sen=
sor_get_info *resp)
> +{
> +       int ret;
> +       struct {
> +               struct cros_ec_command msg;
> +               union {
> +                       struct ec_params_temp_sensor_get_info req;
> +                       struct ec_response_temp_sensor_get_info resp;
> +               } __packed data;
> +       } __packed buf =3D {
> +               .msg =3D {
> +                       .version =3D 0,
> +                       .command =3D EC_CMD_TEMP_SENSOR_GET_INFO,
> +                       .insize  =3D sizeof(buf.data.resp),
> +                       .outsize =3D sizeof(buf.data.req),
> +               },
> +               .data.req.id =3D id,
> +       };
> +
> +       ret =3D cros_ec_cmd_xfer_status(cros_ec, &buf.msg);
> +       if (ret < 0)
> +               return ret;
> +
> +       *resp =3D buf.data.resp;
> +       return 0;
> +}
> +
> +static int cros_ec_hwmon_read_string(struct device *dev, enum hwmon_sens=
or_types type,
> +                                    u32 attr, int channel, const char **=
str)
> +{
> +       struct cros_ec_hwmon_priv *priv =3D dev_get_drvdata(dev);
> +
> +       if (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_label) {
> +               *str =3D priv->temp_sensor_names[channel];
> +               return 0;
> +       }
> +
> +       return -ENODATA;
> +}
> +
> +static umode_t cros_ec_hwmon_is_visible(const void *data, enum hwmon_sen=
sor_types type,
> +                                       u32 attr, int channel)
> +{
> +       const struct cros_ec_hwmon_priv *priv =3D data;
> +       u16 speed;
> +
> +       if (type =3D=3D hwmon_fan) {
> +               if (cros_ec_hwmon_read_fan_speed(priv->cros_ec, channel, =
&speed) =3D=3D 0)
> +                       return 0444;
> +       } else if (type =3D=3D hwmon_temp) {
> +               if (priv->temp_sensor_names[channel])
> +                       return 0444;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct hwmon_channel_info * const cros_ec_hwmon_info[] =3D =
{
> +       HWMON_CHANNEL_INFO(fan,
> +                          HWMON_F_INPUT,
> +                          HWMON_F_INPUT,
> +                          HWMON_F_INPUT,
> +                          HWMON_F_INPUT),
> +       HWMON_CHANNEL_INFO(temp,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL,
> +                          HWMON_T_INPUT | HWMON_T_LABEL),
> +       NULL
> +};
> +
> +static const struct hwmon_ops cros_ec_hwmon_ops =3D {
> +       .read =3D cros_ec_hwmon_read,
> +       .read_string =3D cros_ec_hwmon_read_string,
> +       .is_visible =3D cros_ec_hwmon_is_visible,
> +};
> +
> +static const struct hwmon_chip_info cros_ec_hwmon_chip_info =3D {
> +       .ops =3D &cros_ec_hwmon_ops,
> +       .info =3D cros_ec_hwmon_info,
> +};
> +
> +static void cros_ec_hwmon_probe_temp_sensors(struct device *dev, struct =
cros_ec_hwmon_priv *priv)
> +{
> +       struct ec_response_temp_sensor_get_info info;
> +       size_t candidates, i;
> +       int ret;
> +       u8 temp;
> +
> +       if (priv->thermal_version < 2)
> +               candidates =3D EC_TEMP_SENSOR_ENTRIES;
> +       else
> +               candidates =3D ARRAY_SIZE(priv->temp_sensor_names);
> +
> +       for (i =3D 0; i < candidates; i++) {
> +               if (cros_ec_hwmon_read_temp(priv->cros_ec, priv->thermal_=
version, i, &temp) !=3D 0)
> +                       continue;
> +
> +               ret =3D cros_ec_hwmon_get_temp_sensor_info(priv->cros_ec,=
 i, &info);
> +               if (ret < 0)
> +                       continue;
> +
> +               priv->temp_sensor_names[i] =3D devm_kasprintf(dev, GFP_KE=
RNEL, "%*s",
> +                                                           (int)sizeof(i=
nfo.sensor_name),
> +                                                           info.sensor_n=
ame);
> +       }
> +}
> +
> +static int cros_ec_hwmon_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct cros_ec_dev *ec_dev =3D dev_get_drvdata(dev->parent);
> +       struct cros_ec_device *cros_ec =3D ec_dev->ec_dev;
> +       struct cros_ec_hwmon_priv *priv;
> +       struct device *hwmon_dev;
> +       int ret;
> +
> +       /* Not every platform supports direct reads */
> +       if (!cros_ec->cmd_readmem)
> +               return -ENODEV;
> +
> +       priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->cros_ec =3D cros_ec;
> +
> +       ret =3D priv->cros_ec->cmd_readmem(cros_ec, EC_MEMMAP_THERMAL_VER=
SION,
> +                                        1, &priv->thermal_version);
> +       if (ret < 0)
> +               return ret;
> +
> +       /* Covers both fan and temp sensors */
> +       if (!priv->thermal_version)
> +               return -ENODEV;
> +
> +       cros_ec_hwmon_probe_temp_sensors(dev, priv);
> +
> +       hwmon_dev =3D devm_hwmon_device_register_with_info(dev, "cros_ec"=
, priv,
> +                                                        &cros_ec_hwmon_c=
hip_info, NULL);
> +
> +       return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct platform_device_id cros_ec_hwmon_id[] =3D {
> +       { DRV_NAME, 0 },
> +       { }
> +};
> +
> +static struct platform_driver cros_ec_hwmon_driver =3D {
> +       .driver.name    =3D DRV_NAME,
> +       .probe          =3D cros_ec_hwmon_probe,
> +       .id_table       =3D cros_ec_hwmon_id,
> +};
> +module_platform_driver(cros_ec_hwmon_driver);
> +
> +MODULE_DEVICE_TABLE(platform, cros_ec_hwmon_id);
> +MODULE_DESCRIPTION("ChromeOS EC Hardware Monitoring Driver");
> +MODULE_AUTHOR("Thomas Wei=C3=9Fschuh <linux@weissschuh.net");
> +MODULE_LICENSE("GPL");
>
> --
> 2.45.0
>

