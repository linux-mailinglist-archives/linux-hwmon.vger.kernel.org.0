Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB780BD0CF
	for <lists+linux-hwmon@lfdr.de>; Tue, 24 Sep 2019 19:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394053AbfIXRma (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 24 Sep 2019 13:42:30 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45700 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387559AbfIXRma (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Sep 2019 13:42:30 -0400
Received: by mail-pg1-f196.google.com with SMTP id 4so1681664pgm.12
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Sep 2019 10:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=b25PjZ9f4KQf91gHoZ/sA7aRK+24UL8wYgxN5Qi37+s=;
        b=vA6EZ1BwpZsPaLzGQV8iSv+Hv9klcNnY5SMwJRMBMcGvxqcKoympzEGVdsZA3sId6E
         qtUE+OefpYETjulXC4bF+50sEBl/4+FcrxT5KywAExr0CsXMuFAbWcdE13ymkpwbY4UI
         l4Xls4A9zznkuaLHaBMbiOrLLnI0hr/Ql18pR+tS2s86ZNdO+bB52MN8g2dKFWPSNbX4
         qel9Vszbd/OKp8Vy5zRy07+nyP0gnuc4Jx01iKlcJRMoQlOQbmLe4wd8/tw4ZlCJ3v9X
         WfDJh9SmR3J3bopANm5/OgDU71Lh0MDIBx5dWwLPdpCuvgcJ3za1q8HdS1WmJteTtETg
         scmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=b25PjZ9f4KQf91gHoZ/sA7aRK+24UL8wYgxN5Qi37+s=;
        b=VsQpDpSuMY+xCnyu8s3MHijk35IT9ty2VJLnZADdvZpQF6wLvIwSsMeV6XbUS1DXgS
         CYINszC/VEfJsd8QiZDrakzWcpSzpn7W+v8xcuX6MyRJiLmzwIIIMgsY7h/nxdLCeOD1
         nv3CHNioiis8wsIBOqWsxVoYBy/A0U46w7olHglHk/cdqt310WQNuU2WuVwWxjTqVDBo
         k0YiT18q0k7MZcvmoRUtvcsRuxq0uv5mB0UstS8uT5m7WS6Hl2QJQQMnbW94Wbzous8j
         YD3a/poNRZKDa8YH0MUSdTv//bD9YgSZ+mS88/VGhopJCYBxAdg2vLpxWvbtSkj6bC4V
         X/5A==
X-Gm-Message-State: APjAAAVDlT3hhmPJiOHm3g8+PVQKr/zF9XGkxbiZuntaaZakcCAKwbqj
        dYQ6W85rwHERpe1TJFq1qEJQ7Ht82ZTKFh3ruJoqSA==
X-Google-Smtp-Source: APXvYqwuMZdkP/hktoOEkDRBi5o6/ehk5X6MOBBHbTYmwwX5gnsdFJ5L6cs+WBKrpAflcR1bKXq7ySEw7P9ws/M02EA=
X-Received: by 2002:a17:90a:154f:: with SMTP id y15mr1299955pja.73.1569346948095;
 Tue, 24 Sep 2019 10:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190924173717.198637-1-ndesaulniers@google.com>
In-Reply-To: <20190924173717.198637-1-ndesaulniers@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 24 Sep 2019 10:42:16 -0700
Message-ID: <CAKwvOd=GVdHhsdHOMpuhEKkWMssW37keqX5c59+6fiEgLs+Q1g@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (applesmc) fix UB and udelay overflow
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     clang-built-linux <clang-built-linux@googlegroups.com>,
        jdelvare@suse.com,
        =?UTF-8?Q?Tomasz_Pawe=C5=82_Gajc?= <tpgxyz@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Sep 24, 2019 at 10:37 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Fixes the following 2 issues in the driver:
> 1. Left shifting a signed integer is undefined behavior. Unsigned
>    integral types should be used for bitwise operations.
> 2. The delay scales from 0x0010 to 0x20000 by powers of 2, but udelay
>    will result in a linkage failure when given a constant that's greater
>    than 20000 (0x4E20). Agressive loop unrolling can fully unroll the
>    loop, resulting in later iterations overflowing the call to udelay.
>
> 2 is fixed via splitting the loop in two, iterating the first up to the
> point where udelay would overflow, then switching to mdelay, as
> suggested in Documentation/timers/timers-howto.rst.
>
> Reported-by: Tomasz Pawe=C5=82 Gajc <tpgxyz@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/678
> Debugged-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  drivers/hwmon/applesmc.c | 35 +++++++++++++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
> index 183ff3d25129..2bc12812f52f 100644
> --- a/drivers/hwmon/applesmc.c
> +++ b/drivers/hwmon/applesmc.c
> @@ -46,6 +46,7 @@
>  #define APPLESMC_MIN_WAIT      0x0010
>  #define APPLESMC_RETRY_WAIT    0x0100
>  #define APPLESMC_MAX_WAIT      0x20000
> +#define APPLESMC_UDELAY_MAX    20000
>
>  #define APPLESMC_READ_CMD      0x10
>  #define APPLESMC_WRITE_CMD     0x11
> @@ -157,14 +158,23 @@ static struct workqueue_struct *applesmc_led_wq;
>  static int wait_read(void)
>  {
>         u8 status;
> -       int us;
> -       for (us =3D APPLESMC_MIN_WAIT; us < APPLESMC_MAX_WAIT; us <<=3D 1=
) {
> +       unsigned int us;
> +
> +       for (us =3D APPLESMC_MIN_WAIT; us < APPLESMC_UDELAY_MAX; us <<=3D=
 1) {
>                 udelay(us);
>                 status =3D inb(APPLESMC_CMD_PORT);
>                 /* read: wait for smc to settle */
>                 if (status & 0x01)
>                         return 0;
>         }
> +       /* switch to mdelay for longer sleeps */
> +       for (; us < APPLESMC_MAX_WAIT; us <<=3D 1) {
> +               mdelay(us);
> +               status =3D inb(APPLESMC_CMD_PORT);
> +               /* read: wait for smc to settle */
> +               if (status & 0x01)
> +                       return 0;
> +       }
>
>         pr_warn("wait_read() fail: 0x%02x\n", status);
>         return -EIO;
> @@ -177,10 +187,10 @@ static int wait_read(void)
>  static int send_byte(u8 cmd, u16 port)
>  {
>         u8 status;
> -       int us;
> +       unsigned int us;
>
>         outb(cmd, port);
> -       for (us =3D APPLESMC_MIN_WAIT; us < APPLESMC_MAX_WAIT; us <<=3D 1=
) {
> +       for (us =3D APPLESMC_MIN_WAIT; us < APPLESMC_UDELAY_MAX; us <<=3D=
 1) {
>                 udelay(us);
>                 status =3D inb(APPLESMC_CMD_PORT);
>                 /* write: wait for smc to settle */
> @@ -196,6 +206,23 @@ static int send_byte(u8 cmd, u16 port)
>                 udelay(APPLESMC_RETRY_WAIT);
>                 outb(cmd, port);
>         }
> +       /* switch to mdelay for longer sleeps */
> +       for (; us < APPLESMC_MAX_WAIT; us <<=3D 1) {
> +               mdelay(us);
> +               status =3D inb(APPLESMC_CMD_PORT);
> +               /* write: wait for smc to settle */
> +               if (status & 0x02)
> +                       continue;
> +               /* ready: cmd accepted, return */
> +               if (status & 0x04)
> +                       return 0;
> +               /* timeout: give up */
> +               if (us << 1 =3D=3D APPLESMC_MAX_WAIT)
> +                       break;

Sorry, I need to modify the first for loop in this function to break
out properly. v2 inbound.

> +               /* busy: long wait and resend */
> +               udelay(APPLESMC_RETRY_WAIT);
> +               outb(cmd, port);
> +       }
>
>         pr_warn("send_byte(0x%02x, 0x%04x) fail: 0x%02x\n", cmd, port, st=
atus);
>         return -EIO;
> --
> 2.23.0.351.gc4317032e6-goog
>


--=20
Thanks,
~Nick Desaulniers
