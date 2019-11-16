Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5935FF444
	for <lists+linux-hwmon@lfdr.de>; Sat, 16 Nov 2019 18:12:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727810AbfKPRM2 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 16 Nov 2019 12:12:28 -0500
Received: from pietrobattiston.it ([92.243.7.39]:54826 "EHLO
        jauntuale.pietrobattiston.it" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727568AbfKPRM1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 16 Nov 2019 12:12:27 -0500
Received: from amalgama (unknown [IPv6:2a02:578:85b0:500:2a18:9d59:67ec:cc90])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: giovanni)
        by jauntuale.pietrobattiston.it (Postfix) with ESMTPSA id A65DAE1E98;
        Sat, 16 Nov 2019 18:12:24 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        by amalgama (Postfix) with ESMTP id 15C803C0340;
        Sat, 16 Nov 2019 18:12:24 +0100 (CET)
Subject: Re: [PATCH v2] dell-smm-hwmon: Add support for disabling automatic
 BIOS fan control
To:     Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191116140649.114592-1-gio@debian.org>
 <20191116145845.xmhki3ckza26eoln@pali>
 <7bc8ec9a-f559-96c8-36fd-6e11a1420626@roeck-us.net>
From:   Giovanni Mascellani <gio@debian.org>
Autocrypt: addr=gio@debian.org; prefer-encrypt=mutual; keydata=
 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
 uq3/WmRPv8r10mXRkWvDuXvi
Organization: Debian
Message-ID: <e938f226-f9f1-0c17-865c-45942e9287e8@debian.org>
Date:   Sat, 16 Nov 2019 18:12:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <7bc8ec9a-f559-96c8-36fd-6e11a1420626@roeck-us.net>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="UBAF0jBTKr1VOH9v6J4ZmEI2uTbgQsYj0"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UBAF0jBTKr1VOH9v6J4ZmEI2uTbgQsYj0
Content-Type: multipart/mixed; boundary="AF1lTDNJxtzHz7OsqvLfVNraXivuaePcO";
 protected-headers="v1"
From: Giovanni Mascellani <gio@debian.org>
To: Guenter Roeck <linux@roeck-us.net>, =?UTF-8?Q?Pali_Roh=c3=a1r?=
 <pali.rohar@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <e938f226-f9f1-0c17-865c-45942e9287e8@debian.org>
Subject: Re: [PATCH v2] dell-smm-hwmon: Add support for disabling automatic
 BIOS fan control
References: <20191116140649.114592-1-gio@debian.org>
 <20191116145845.xmhki3ckza26eoln@pali>
 <7bc8ec9a-f559-96c8-36fd-6e11a1420626@roeck-us.net>
In-Reply-To: <7bc8ec9a-f559-96c8-36fd-6e11a1420626@roeck-us.net>

--AF1lTDNJxtzHz7OsqvLfVNraXivuaePcO
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

Il 16/11/19 16:53, Guenter Roeck ha scritto:
>>> =C2=A0 @@ -1135,12 +1183,48 @@ static struct dmi_system_id
>>> i8k_blacklist_fan_support_dmi_table[] __initdata =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { }
>>> =C2=A0 };
>>> =C2=A0 +struct i8k_manual_fan_data {
>>> +=C2=A0=C2=A0=C2=A0 unsigned int smm_manual_fan;
>>> +=C2=A0=C2=A0=C2=A0 unsigned int smm_auto_fan;
>>> +};
>>
>> Just cosmetic suggestion: As this structure contains data for both
>> manual and automatic mode I would not use "manual" in name. But e.g.
>> something like "i8k_bios_fan_control_data"...
>>
> Or i8k_fan_control_data. Also, "manual" and "auto" for the variable
> names would be sufficient.

"auto" is a keyword, so I cannot use it. I've left "manual_fan" and
"auto_fan" therefore.

Thanks and ack for all the other changes. I'll submit the updated patch
shortly.

Giovanni.
--=20
Giovanni Mascellani <g.mascellani@gmail.com>
Postdoc researcher - Universit=C3=A9 Libre de Bruxelles


--AF1lTDNJxtzHz7OsqvLfVNraXivuaePcO--

--UBAF0jBTKr1VOH9v6J4ZmEI2uTbgQsYj0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSiBF6hBvCQNcghJEaNr8EMz954SQUCXdAt+AAKCRCNr8EMz954
SS/uAP98uW2kcCtA2bTjPJ/n6JizaIgnv1gxlsSYT3q9ijPL7QD9HJ7EcIsRZl0H
fC8tmsABITDhiB0d4FzlKA+6m5PbogI=
=A8oe
-----END PGP SIGNATURE-----

--UBAF0jBTKr1VOH9v6J4ZmEI2uTbgQsYj0--
