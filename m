Return-Path: <linux-hwmon+bounces-2964-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2D79284C8
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jul 2024 11:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 170791C24C4F
	for <lists+linux-hwmon@lfdr.de>; Fri,  5 Jul 2024 09:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D488146D69;
	Fri,  5 Jul 2024 09:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KK6SxJ5n"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ECC146584
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jul 2024 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720170559; cv=none; b=Bf6nxJMb5QQZ7aDqJxLWuDrYa1jP/8bGy8orfWyL8KdBy2biMEeIBby4KFLmJtWrx7L4RGUkMcRIVZ25uXtWYr3UlMIIcnsAaccaN4u+C1U3849pRXbbSoL5t9iwGaiJrm7BmEs3SW0n+kvOWCQFrsp+3diVyIjVvQHIMu+wf3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720170559; c=relaxed/simple;
	bh=z7uln/wCHBuVL23Qb6fK90d/XfI2YedBBgXbvaPu1+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3hrEMqI3K6kabSeJuPm3rPFqNNHK79hL3k3OS9mDDdx9pUTNOtbkHtifsxiM5lkth0N8O47hohfyKgeqJ26fiWBMXOU6N0nXnxFnA+vBSJbi3VNs8nS9k8AMRkuWkUxUv5UrK4KCFGf2odw1c0u2nglaIEuF38p6LOApvuIs+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KK6SxJ5n; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-58b447c5112so1642023a12.3
        for <linux-hwmon@vger.kernel.org>; Fri, 05 Jul 2024 02:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720170554; x=1720775354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yawcdPmdc9R5nFHXmROZ5YiAiTzKYfck2rMJGJ0W1kc=;
        b=KK6SxJ5nU4lB3JZ8mP8u1ghrSqksETJhT/kH9xC3+3a8HjgDkh6MKG0pWQPQI9kbjx
         bJ/oPeOAESH/Iift8cL/5LOuVgOeba08dTKenKMxeyXNEoz8scd+F7UHyMaMwgI/BUTF
         z+5HiGbEkuBPyZiGQFKMmZgDih9tqs9qZWEzbEAaTd24efRqWxvWka+J9ZVvC2VwhnT0
         kSOH8zoZI9JcvVJOxhN+JkGgpoCKzpJY7sPKIp5FdYFwYuv2+7yY5zavlfuHhcjxhP/n
         p2Jc7VKrWIZvfbAtAzUfyZCAtfWCaJvsBerkjUvGbJmOX856jiKb97mKngjb7DsoYnc1
         2F9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720170554; x=1720775354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yawcdPmdc9R5nFHXmROZ5YiAiTzKYfck2rMJGJ0W1kc=;
        b=ZtyneCAQxrhuipPbTEDLf1vldPx/UsTM9ukf+UxCwdR0UzCCLNijJNOcdOK7StEQl9
         CoM5rCFfVV083EqXMDfAzTgIS9aZ8UM4KgbOG6osfSPW3oJ4FwwDOUj8CJb93JW/H0Sa
         MbFUw7k60GpS7R/QkhBNBMVQgJA5jt7SfdBXmb9FwL1GISQMhBEm05X8+RTDuQZh8BBh
         Fan2/vYsydq+AJ9KTpf5N2col5QSCBzn8vUb4UWP1qfUpZFcQiQz/gQHP9Vj27TnAR5Y
         HxV4eBsBsKZXaVztJ1JxHqG2Uz6o7wDQR5u2Yg5rjXO2g4SUbyyMOjT40AFaa7t6wSMO
         o0ew==
X-Forwarded-Encrypted: i=1; AJvYcCUOrqaqTkNca7EI+bXq4sI2M9fKRY6FzLkv9l2OFsyorlsuZQz8IG0gkolcze90Bs8jIM8oDn8Hf///saQOU8gnlURRB6zwZn4hm3g=
X-Gm-Message-State: AOJu0Yz+Pvwlcq7L1yBZ7KNWIwfYqLAZtL6GThE7AoRZHADR2KQSr9bS
	4kx0Odzh2QznQj1DjvZkIQ7ygIEdMJufVQN9QUMXFbwm6/5MWWGHsBT5ULXQFXw=
X-Google-Smtp-Source: AGHT+IHsYMalDL4OFCPxRq3oohtjYA/UuspzbffcUEicK/5Ws4VMPv3kobeNAJ/RWF12C4F4dwAbOw==
X-Received: by 2002:a05:6402:278c:b0:587:86d8:8b54 with SMTP id 4fb4d7f45d1cf-58e5a6ee9f5mr3180323a12.4.1720170554293;
        Fri, 05 Jul 2024 02:09:14 -0700 (PDT)
Received: from localhost (p50915e7b.dip0.t-ipconnect.de. [80.145.94.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58f90b20091sm646111a12.45.2024.07.05.02.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:09:13 -0700 (PDT)
Date: Fri, 5 Jul 2024 11:09:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: jdelvare@suse.com, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: Add adt7475 fan/pwm properties
Message-ID: <drqvaon5lb2ei3jqofutbr6demibyfdhbmr24sva27gzpqdnon@fxa7rpl33iih>
References: <20240528225638.1211676-1-chris.packham@alliedtelesis.co.nz>
 <20240528225638.1211676-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bgu6tv6sylwa4466"
Content-Disposition: inline
In-Reply-To: <20240528225638.1211676-2-chris.packham@alliedtelesis.co.nz>


--bgu6tv6sylwa4466
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Chris,

sorry for taking so long to respond. Don't take it personal, I'm way
behind my maintainer dutys in general.

On Wed, May 29, 2024 at 10:56:36AM +1200, Chris Packham wrote:
> Add fan child nodes that allow describing the connections for the
> ADT7475 to the fans it controls. This also allows setting some
> initial values for the pwm duty cycle and frequency.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>=20
> Notes:
>     I realise there is still some discussion about how to express the
>     frequency and duty cycle. I have a personal preference for using hertz
>     for the frequency and 0-255 for the duty cycle but if the consensus is
>     to express these things some other way I'm fine with doing some math.
>    =20
>     Changes in v4:
>     - 0 is not a valid frequency value
>     Changes in v3:
>     - Use the pwm provider/consumer bindings
>     Changes in v2:
>     - Document 0 as a valid value (leaves hardware as-is)
>=20
>  .../devicetree/bindings/hwmon/adt7475.yaml    | 25 ++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.yaml b/Docum=
entation/devicetree/bindings/hwmon/adt7475.yaml
> index 051c976ab711..bfef4c803bf7 100644
> --- a/Documentation/devicetree/bindings/hwmon/adt7475.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/adt7475.yaml
> @@ -51,6 +51,15 @@ properties:
>        enum: [0, 1]
>        default: 1
> =20
> +  "#pwm-cells":
> +    const: 4
> +    description: |
> +      Number of cells in a PWM specifier.
> +      - 0: The pwm channel
> +      - 1: The pwm frequency in hertz - 11, 14, 22, 29, 35, 44, 58, 88, =
22500

Nack, don't deviate from how PWMs are usually referenced. So specify the
period in nanoseconds, not Hertz.

> +      - 2: PWM flags 0 or PWM_POLARITY_INVERTED
> +      - 3: The default pwm duty cycle - 0-255

I'd be ok with that, however please add support for that in the pwm core
and then just use that.

You wrote that you find it irritating that the duty is specified in
nanoseconds and not a percentage. The reason for that is historic. Also
it gives a more precise specification (at least compared to the naive
representation of the integer percentage as an integer type).
For the rework of how PWM waveforms are represented I picked
"duty_length" as variable name for this value, in the hope this is less
confusing.

untested prototype for a 4th member in pwm specifiers:

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 5c1d20985148..f732235df12d 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -251,7 +251,7 @@ int pwm_adjust_config(struct pwm_device *pwm)
 	 * duty cycle of 0.
 	 */
 	if (!state.period) {
-		state.duty_cycle =3D 0;
+		state.duty_cycle =3D pargs.duty_length;
 		state.period =3D pargs.period;
 		state.polarity =3D pargs.polarity;
=20
@@ -437,6 +437,10 @@ of_pwm_xlate_with_flags(struct pwm_chip *chip, const s=
truct of_phandle_args *arg
 	if (args->args_count > 2 && args->args[2] & PWM_POLARITY_INVERTED)
 		pwm->args.polarity =3D PWM_POLARITY_INVERSED;
=20
+	pwm->args.duty_length =3D 0;
+	if (args->args_count > 3)
+		pwm->args.duty_length =3D args->args[3];
+
 	return pwm;
 }
 EXPORT_SYMBOL_GPL(of_pwm_xlate_with_flags);
@@ -457,6 +461,10 @@ of_pwm_single_xlate(struct pwm_chip *chip, const struc=
t of_phandle_args *args)
 	if (args->args_count > 1 && args->args[1] & PWM_POLARITY_INVERTED)
 		pwm->args.polarity =3D PWM_POLARITY_INVERSED;
=20
+	pwm->args.duty_length =3D 0;
+	if (args->args_count > 2)
+		pwm->args.duty_length =3D args->args[2];
+
 	return pwm;
 }
 EXPORT_SYMBOL_GPL(of_pwm_single_xlate);
@@ -1353,6 +1361,9 @@ static struct pwm_device *acpi_pwm_get(const struct f=
wnode_handle *fwnode)
 	if (args.nargs > 2 && args.args[2] & PWM_POLARITY_INVERTED)
 		pwm->args.polarity =3D PWM_POLARITY_INVERSED;
=20
+	/* Maybe extend this to apply args.args[3] if args.nargs > 3? */
+	pwm->args.duty_cycle =3D 0;
+
 	return pwm;
 }
=20
@@ -1514,6 +1525,7 @@ struct pwm_device *pwm_get(struct device *dev, const =
char *con_id)
=20
 	pwm->args.period =3D chosen->period;
 	pwm->args.polarity =3D chosen->polarity;
+	pwm->args.duty_length =3D 0;
=20
 	return pwm;
 }
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index f8c2dc12dbd3..678a97706eac 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -41,6 +41,7 @@ enum pwm_polarity {
  */
 struct pwm_args {
 	u64 period;
+	u32 duty_length;
 	enum pwm_polarity polarity;
 };
=20
(I think it doesn't make sense to use a u64 here. At least the oftree
values are only 32 bit wide. I didn't check the ACPI part, if that is
only 32 bit wide, too, it would make sense to make period use a 32 bit
type, too.)

Best regards
Uwe

--bgu6tv6sylwa4466
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaHuDYACgkQj4D7WH0S
/k4H9Af+O1HkX2H4GXenGFqpvtMnbx935Ir2D1Fj9LzGpibaiBBA3v2zbr22qpPJ
YwlBG7YQken7sjySLxHLYTtgsqofwWThNKkRE94iJmGLNcE29IW0oq6ATryTiry4
V/F3T3X78rjpK5lTWnLZzs1A8lsIwD+XBZfczkq79fcwUOFN5bLCXHv/GyMTkwuQ
4uedlGEPZZ/kL1QfzBztKuw9Z46Yfkh8KRYAuW75EkDjfyl8VMWGDFi+lX1wGioC
eIaBxX9qcBhoKmT+27g4HctQ3Cp4XdLD2qM856PO1I5+dTaGFKuZXeN4KdjeULnn
l/5NTnIRGwFWHmasBFUe0VAxOnWoaQ==
=KiYp
-----END PGP SIGNATURE-----

--bgu6tv6sylwa4466--

