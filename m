Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 748ED7D9C97
	for <lists+linux-hwmon@lfdr.de>; Fri, 27 Oct 2023 17:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbjJ0PID (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 27 Oct 2023 11:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbjJ0PIB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Oct 2023 11:08:01 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3171B6
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Oct 2023 08:07:58 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231027150756euoutp01ec2bfd05d09592b6f67441398dd89f05~R-1VJO1FD1326113261euoutp01u;
        Fri, 27 Oct 2023 15:07:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231027150756euoutp01ec2bfd05d09592b6f67441398dd89f05~R-1VJO1FD1326113261euoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1698419276;
        bh=SJ636XENRBVKqcMBGxmurSV7+gQcnrcFhpYD2j7jO0M=;
        h=From:To:Cc:Subject:Date:References:From;
        b=pn6wxgfELEewMkOlHEoKeO1b6nbRfz8dlK7gbBIq9P/epQWM7ZgxzGx1Gy2jXvROK
         Dwksc2rl+W391trcGxgSbEwzYuFggUvd09rO29x5qrkvqumFRXiPnECyVRyMILjfhU
         9XjocWCZFjXCKYjKm/o8DuYQ66jL62ur/tDX8mIk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20231027150755eucas1p2c95ba626e303d1731fa7df5f475a361b~R-1UoIcFS2825028250eucas1p2n;
        Fri, 27 Oct 2023 15:07:55 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 00.D1.42423.B42DB356; Fri, 27
        Oct 2023 16:07:55 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20231027150755eucas1p205057d22989db5c031ea5db27b8d9836~R-1UJg5ug2825028250eucas1p2m;
        Fri, 27 Oct 2023 15:07:55 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20231027150755eusmtrp1159ed46c96599aba7c9a56f23f6c200a~R-1UJBziA2565225652eusmtrp1U;
        Fri, 27 Oct 2023 15:07:55 +0000 (GMT)
X-AuditID: cbfec7f2-a3bff7000002a5b7-96-653bd24bf119
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 0A.63.10549.A42DB356; Fri, 27
        Oct 2023 16:07:55 +0100 (BST)
Received: from localhost (unknown [106.120.51.111]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20231027150754eusmtip1bc2eb4854b123185dabd7018994e5455~R-1T6KbUY0985809858eusmtip1R;
        Fri, 27 Oct 2023 15:07:54 +0000 (GMT)
From:   Lukasz Stelmach <l.stelmach@samsung.com>
To:     James Seo <james@equiv.tech>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: [BUG] hp-wmi-sensors: probe of 8F1F6435-9F42-42C8-BADC-0E9424F20C9A
 failed with error -22
Date:   Fri, 27 Oct 2023 17:07:09 +0200
Message-ID: <oypijdmsw4f6jm.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduznOV3vS9apBjOWqVnMu3aQ2aL99VZG
        iycLzzA5MHt8777I5LHzewO7x+dNcgHMUVw2Kak5mWWpRfp2CVwZ27v7mAtW8VSsu7ibvYHx
        EFcXIweHhICJxIVj1l2MXBxCAisYJSbfnMsM4XxhlGi9tZANwvnMKPF67w32LkZOsI7VU+6x
        QySWM0rcWLUGquUFo8T5eW1MIHPZBPQk1q6NAGkQEVCQaJ2zgRHEZhZwljg77w8ziC0skCIx
        68kBJhCbRUBV4vm7A2BxXgFzib7+nWC2qIClxPGt7WwQcUGJkzOfsEDMyZWYef4NI8heCYGV
        HBKv3h5mhLjOReLjvmusELawxKvjW6CulpE4PbmHBaKhnVGi6cpCVghnAqPE544mJogqa4k7
        536xQdiOEh/PvmKEhBKfxI23ghCb+SQmbZvODBHmlehoE4KoVpFY17+HBcKWkuh9tQLqHg+J
        E0d2gz0jJBAr0Xqkn2kCo/wsJP/MQvLPLKCpzAKaEut36UOEtSWWLXzNDGHbSqxb955lASPr
        Kkbx1NLi3PTUYsO81HK94sTc4tK8dL3k/NxNjMBEcvrf8U87GOe++qh3iJGJg/EQowpQ86MN
        qy8wSrHk5eelKonwRvpYpArxpiRWVqUW5ccXleakFh9ilOZgURLnVU2RTxUSSE8sSc1OTS1I
        LYLJMnFwSjUw9S3oFl2yM23fN/ntu1qe/tp2Y2vZbasJTh6Kp4I/TLwhbviO7ep/F6mKrSeO
        P4uSVC5YJ8Su4lw8cY6mdcihy4skYjO/8hz973SEi9t6yt63U4KP1KwTWL+MXe3Iw/zbOZW3
        NHVU9CVXKi/sd4v0ZD11+9KlsklWP9/syuC32FBSYPgk4OS9Pja1eYnFMZ/ZfogcXduRlP9l
        7xSz5lWzPhxidL7m8HX3pHS/zSw/Fj1Z514zfYnZV3HG7wZpv75PPbvy6J8o84wbGk1e+2dU
        3s64dM9z2XZ7qaAlq/ZsceurP3vzd8yToNV78sOW7H73x+mEdcyp6TfM+LI/7frMsJS1K3Si
        KcOn9H9HhZ9ObnRWYinOSDTUYi4qTgQAuYmB8p8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOLMWRmVeSWpSXmKPExsVy+t/xu7rel6xTDQ7fY7KYd+0gs0X7662M
        Fk8WnmFyYPb43n2RyWPn9wZ2j8+b5AKYo/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyN
        zWOtjEyV9O1sUlJzMstSi/TtEvQytnf3MRes4qlYd3E3ewPjIa4uRk4OCQETidVT7rF3MXJx
        CAksZZQ4tfoBSxcjB1BCSmLl3HSIGmGJP9e62CBqnjFKPN11gxmkhk1AT2Lt2giQGhEBBYnW
        ORsYQWxmAWeJs/P+MIPYwgIpErOeHGACsVkEVCWevzsAFucVMJfo698JZosKWEoc39rOBhEX
        lDg58wkLxJxsia+rnzNPYOSbhSQ1C0lqFtAVzAKaEut36UOEtSWWLXzNDGHbSqxb955lASPr
        KkaR1NLi3PTcYkO94sTc4tK8dL3k/NxNjMBQ33bs5+YdjPNefdQ7xMjEwXiIUQWo89GG1RcY
        pVjy8vNSlUR4I30sUoV4UxIrq1KL8uOLSnNSiw8xmgK9M5FZSjQ5HxiFeSXxhmYGpoYmZpYG
        ppZmxkrivJ4FHYlCAumJJanZqakFqUUwfUwcnFINTB1zXuYffXPxQuL8i59dWLZWFKd+dF9i
        6HnC/XFYxPxZR1nPrrwll9DCwfr9MsfhBee3/H55SeXH5qM9zvmXEidX5+9f2WkWdN3CTYJz
        Slj59eQ80f6VHcEzz8c2rFMv2Z18nn3pjlwzhqW5T/mPTdVvmGyiePT0tYmzT5x67/3rubr8
        PJ1726Sqj3Skvz/wjK1fTr/M/YGRYC+LRtizDZVd6Td3xrW0LkhvWJeu9iiay1dQ1XXi6bUO
        HA3+blusL3BcDgsRNktZviOs00mvsI2tbh+n1QubLBmVwh+fpjcscsvVu8Er4LIwYmJL3uN3
        mxonm31WTVhlcSFp97lffkdkw594dbDud8xprTmwSomlOCPRUIu5qDgRALTxlFUKAwAA
X-CMS-MailID: 20231027150755eucas1p205057d22989db5c031ea5db27b8d9836
X-Msg-Generator: CA
X-RootMTR: 20231027150755eucas1p205057d22989db5c031ea5db27b8d9836
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231027150755eucas1p205057d22989db5c031ea5db27b8d9836
References: <CGME20231027150755eucas1p205057d22989db5c031ea5db27b8d9836@eucas1p2.samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I've got HP EliteDesk 800 G6 Tower PC running Linux 6.1 from Debian=C2=A012.
I managed to build the hp-wmi-sensors out of tree. When I loaded it I
got EINVAL.

    hp-wmi-sensors: probe of 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed wi=
th error -22

I managed to track it down. And it happens in check_wobj() called from
check_platform_events_wobj() because in the for loop when prop=3D=3D0 the
type is ACPI_TYPE_BUFFER instead of ACPI_TYPE_STRING. When I bypass this
particular check like this

    if (prop =3D=3D 0 && type =3D=3D ACPI_TYPE_BUFFER)
            continue;

everything else works like charm and I can read senosrs via sysfs. I'd
like to perpare a proper patch, but I've got no idea how to do properly
work this quirk around. What are your suggestions?

Kind regards,
=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmU70h0ACgkQsK4enJil
gBBwiwf/Z0TVt+lKBIw2VMJl4rE0XWBWkusb14T+IAYu/xg+VRUUyGU7QO2CVvPI
jB9gKFk/zRhyNAK0MwvvyHryEmIKlYcS5OampPxDkqG+GbIgG8zb/SXvIUGxzVBc
q4/smXacXTa0Cev/UXOh1Y4Q5fYnSw2PMyki91/HR7cFMHZ53sb9RFQGWHhcluwe
3qdXLQbwY/kkVbNDdr8lfT6d6aZs1es5/vRoEayyDbN68BU/arnJzxN5wyjl8E2m
ekvT7HvpBulX19feI6NAjIN4+NNhf0fS8UHULdweK5jZrRR/cO6ruiWHXWRK1oBl
lA995stifCvUsOjTpqd8OJXsoz3hQQ==
=poOV
-----END PGP SIGNATURE-----
--=-=-=--
