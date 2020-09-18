Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9376526F30C
	for <lists+linux-hwmon@lfdr.de>; Fri, 18 Sep 2020 05:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728029AbgIRDDz (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Thu, 17 Sep 2020 23:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727407AbgIRCE4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Sep 2020 22:04:56 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06957C06174A;
        Thu, 17 Sep 2020 19:04:55 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id a2so3958599otr.11;
        Thu, 17 Sep 2020 19:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=JgBAyZtv1KdUHX/gAQyyrYj55BDEy/By7Xa7DxmA1yI=;
        b=Fk2j1F/6itl71FwnA+DrSNdR2Wl4XO0gb/aUDB6WAYUFedng0MONlpyMhjVjTT+fS3
         HHbvyIUosrWw6yeLdAbDpHhFPwI/pfas9exYY5AYf+IAMXcaIxXycpQGmb90dhc7oC3R
         PJ8gwax+R+1fF8h6nfEqb4/T17sW5eDgFk8JWLJ45KtLLe1NnJnIwfOc0NNWMhotA22J
         bJPi4MlWu426BIRZFiUVJBL580KjnKTeUm+VR88DMK4MYMr1wHFhSv0ej3L8lYTAvd7G
         JHX8sI40oTjDbOuEKs+sefx5kpQXlWs4XYu6yDiS4idYdEb2ektkFpl2Y9pF5obKAxTM
         OD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=JgBAyZtv1KdUHX/gAQyyrYj55BDEy/By7Xa7DxmA1yI=;
        b=RcF3E3aXXorEGCRXI6jycoVikpSnU7LfmxlkiNZjRkiHA7SIyI3KMaLPPNXqRPuuy7
         zcjECYKNd93r1fQSFLsyhymyw0aTJsXt+8FjwgeCd0JJDQi+qRnVSWxC9ui2JkgozwUe
         9rCH2YlbCCdGf8bBgs70ncACD86DxfORM1n3L/WSC45LINjWzMbFXK6sSWbOw6sSrgbr
         QJMcGIbQJ6meazwoIZUn1fs1RsxiSSbOFgahI6TCec9iG0wNIcsjLBSZPk2g1Ye69qBT
         cftjTUwtaM+VeI6DIwPzFzoQ0b4DAZAymiT1oZudUWoz7LQ4Ji+R8anS9SsMPFgY+uZk
         77ZA==
X-Gm-Message-State: AOAM531UVrF2IqxfeuTFOkTLxfjZNpQwy/5+4hAvyzkC83HToVhYUWF3
        b/ZwGUPYex5vZgNnlNNUHjqtjqSpl1g=
X-Google-Smtp-Source: ABdhPJxSH5SMmhGU7Eiwux8Xtw+fyQLP+N+Rn6/6zrWE/sT42KA/mudBE3nDiZtNdbRd2Co0MVISMw==
X-Received: by 2002:a9d:7459:: with SMTP id p25mr20537769otk.234.1600394695181;
        Thu, 17 Sep 2020 19:04:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 91sm1214705ott.55.2020.09.17.19.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 19:04:53 -0700 (PDT)
Subject: Re: [PATCH 3/3] hwmon: (lm75) Add regulator support
To:     Mark Brown <broonie@kernel.org>, Alban Bedel <alban.bedel@aerq.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200917101819.32045-1-alban.bedel@aerq.com>
 <20200917101819.32045-4-alban.bedel@aerq.com>
 <20200917110053.GA4755@sirena.org.uk>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <e5863e71-2531-b0de-c432-4bc2967d56c8@roeck-us.net>
Date:   Thu, 17 Sep 2020 19:04:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917110053.GA4755@sirena.org.uk>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oNLHzmw1I7aHb2xcXcXGZxEdnGQCFEQkp"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oNLHzmw1I7aHb2xcXcXGZxEdnGQCFEQkp
Content-Type: multipart/mixed; boundary="npx1QPJMHHXPGiElNcnf2YFJTuHRgqEye"

--npx1QPJMHHXPGiElNcnf2YFJTuHRgqEye
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 9/17/20 4:00 AM, Mark Brown wrote:
> On Thu, Sep 17, 2020 at 12:18:19PM +0200, Alban Bedel wrote:
>=20
>> +	data->vs =3D devm_regulator_get_optional(dev, "vs");
>> +	if (IS_ERR(data->vs)) {
>=20
> Unless the device can work without power you should not be using
> regulator_get_optional().
>=20

The driver works today without regulator, and needs to continue
doing so.

Guenter


--npx1QPJMHHXPGiElNcnf2YFJTuHRgqEye--

--oNLHzmw1I7aHb2xcXcXGZxEdnGQCFEQkp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEiHPvMQj9QTOCiqgVyx8mb86fmYEFAl9kFcMACgkQyx8mb86f
mYFkCRAApbWUrLrU34NeN2pqWh8G1DFeWcrTFJHjcEO4jFDbX/nsgcNR2GCK/JS5
uQ4/zrbbz0QudxFS79L9xjr7YTOoolp0nGsAfv6hXmum1ljGiS1iOk6PeeFC47zg
xzJzxfjsOucXH+QwOqisD9iBX/ITl+iIc8enxvehhVKWJjgDw+e6xT6XNhgb7IGh
uZNrp1kOYgvrFRS2fe6RO6pid1ZLiiPiG3UaydUP7N11nVXL3XUAKKuP9Bk2f1qR
96CJ1OgQqs4wz6iAXq4zayB6RPa8vmtMqHEK710aYqhWNcnz1c8A/UdRwLx6uOXC
xAc6IDqXEADQU0oDUGzPe64A7W9/5MFBsMrNcQ2f6oQ09NzH/fQkb0KTB5tEw4y8
57Uqbh3CsywaybRYDzmyCy+WhafDyDy07ZL/KvlZgf+qJuZYi0bIGfFxi0ipMxU4
0qq2Xz7TRQwTPikSG/Fo96/wmQpQkhV/01I1yUDHAbPnbZf8xpCQocisd9BQKnFm
dHjN19iPkDrhMfEsTscRAm5ldw0toBDdk9zV3j8oV3INkfuKeXXimrSi8aMoKLJY
CtxRMlodBvZ/0x8G5JUDjsyNBW4tVEm0fjYZghlHEryP3YIgT4RxHyKyb0NffGg1
Z7TFnrfCTqve+5kg0XjrIJBeONjmiJCQpthGJRiQF288j6lv/+U=
=Zv+s
-----END PGP SIGNATURE-----

--oNLHzmw1I7aHb2xcXcXGZxEdnGQCFEQkp--
