Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37E3A138629
	for <lists+linux-hwmon@lfdr.de>; Sun, 12 Jan 2020 13:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732786AbgALMIK (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 12 Jan 2020 07:08:10 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39437 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732757AbgALMIJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Jan 2020 07:08:09 -0500
Received: by mail-lj1-f194.google.com with SMTP id l2so6926249lja.6
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Jan 2020 04:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dpvAwF8ij5ixsdOGKkkuE/VXUPUlzWaJnocDXIvBfPY=;
        b=zdOsi9KQvxoeCvLRkX4N6k2Rlw/MryRYHauLiUfG+CPI0762MNGMQZf/B8ipKf1Gcb
         GFZMx8d8xkfHQb1JMAaPDUU3+2nGMKzFuS6w7FjoaU/NCHPZ+GZmM7ANTtHj9mzm+1H8
         q9x12VUaz4AxtFJAUk27vwD2MihV1RwOpFS1hIRTihV1azvQeeH2vAbC46r/RRnhsuNL
         g2NfP1ImCzXQcn4XkGQuUjnr4VsObyaug1VZAqQNG8xpthgsg0SyjEBno1LlfdpLosH9
         EB8+QZylnRZ7hzhZavMS6185sy7ABs1KObfiCwjtPnuBLerkdYGaAw9Gms5xPxtkD5MB
         UC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dpvAwF8ij5ixsdOGKkkuE/VXUPUlzWaJnocDXIvBfPY=;
        b=Y66tA9bD2xftxjmlxxKFH+5WLMftv0aabBbesUJkCktz9FO48wkCB8EP88kmZRI4SE
         Xx22tgmgclGc8Em0Slxkpzot50a2aOFG+R+9rajZZls6Q5Mzw2iqBRDy57aADOsfmtGY
         RaR+6GheFCSmcFXRl2eO+27riZluev1za2gCdeNa2OJnfCutHfyZqDRhdZv2jeF6QMjq
         vWz9BHsAjhvCGqtIdXALdOz/fAuX7gTlco50egmjqnM26QmugK9Sg2hsgESUMgKZwG+k
         LRdeTIhnVzbE+eXF95bPIOMjCma0egmh1YcU7UGib+QN2u/GY7CHvbaVJgCnoIigDlnu
         P8Ow==
X-Gm-Message-State: APjAAAXQ4hjkMPEqzPgJz/WTozAOiSJM87pbYQ5l23cFgRuI12Psk2/y
        OrFF3y4KyFiDZBaGpp1LZUG1f7lk94FWTQEjfYqVpw==
X-Google-Smtp-Source: APXvYqwZny2C/FIBKGxDbeJHV8CyKSMqhPtYMIYeGdOHwsz7zuDMm2sx1sA6URcYRatCxJmlCo3C48uygmVJg5exFXE=
X-Received: by 2002:a05:651c:111c:: with SMTP id d28mr8195967ljo.32.1578830887594;
 Sun, 12 Jan 2020 04:08:07 -0800 (PST)
MIME-Version: 1.0
References: <20191215174509.1847-1-linux@roeck-us.net> <20191215174509.1847-2-linux@roeck-us.net>
 <yq1r211dvck.fsf@oracle.com> <b22a519c-8f26-e731-345f-9deca1b2150e@roeck-us.net>
 <yq1sgkq21ll.fsf@oracle.com> <20200108153341.GB28530@roeck-us.net>
 <38af9fda-9edf-1b54-bd8d-92f712ae4cda@roeck-us.net> <CAEJqkgg_piiAWy4r3VD=KyQ7pi69bZNym2Ws=Tr8SY5wf+Sprg@mail.gmail.com>
 <CACRpkdYU7ZDcKp+BbXRCnEFDw1xwDkU_vXsfo-AZNUWGEVknXQ@mail.gmail.com> <CAEJqkggo3Mou1SykjisyYn+3SGGgNfnKagr=7ZPyw=Y=1MZ55w@mail.gmail.com>
In-Reply-To: <CAEJqkggo3Mou1SykjisyYn+3SGGgNfnKagr=7ZPyw=Y=1MZ55w@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 12 Jan 2020 13:07:56 +0100
Message-ID: <CACRpkdayHFmdz4nAMaXR07Hcy=dLLGnnU8PkFhwQKuDTLnvOSw@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: Driver for temperature sensors on SATA drives
To:     Gabriel C <nix.or.die@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Jan 12, 2020 at 1:03 PM Gabriel C <nix.or.die@gmail.com> wrote:
> Am So., 12. Jan. 2020 um 12:22 Uhr schrieb Linus Walleij
> <linus.walleij@linaro.org>:
> >
> > On Sun, Jan 12, 2020 at 12:18 PM Gabriel C <nix.or.die@gmail.com> wrote=
:
> >
> > > What I've noticed however is the nvme temperature low/high values on
> > > the Sensors X are strange here.
> > (...)
> > > Sensor 1:     +27.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.=
8=C2=B0C)
> > > Sensor 2:     +29.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.=
8=C2=B0C)
> > (...)
> > > Sensor 1:     +23.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.=
8=C2=B0C)
> > > Sensor 2:     +25.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.=
8=C2=B0C)
> >
> > That doesn't look strange to me. It seems like reasonable defaults
> > from the firmware if either it doesn't really log the min/max temperatu=
res
> > or hasn't been through a cycle of updating these yet. Just set both
> > to absolute min/max temperatures possible.
>
> Ok I'll check that.
>
> Do you mean by setting the temperatures to use a lmsensors config?
> Or is there a way to set these with a nvme command?

Not that I know of.

The min/max are the minumum and maximum temperatures the
device has experienced during this power-on cycle.

(If I understood things right!)

If the device firmware doesn't log that, or the firmware hasn't
ran through a log point, it makes sense to report absolute
min/max of the scales.

Yours,
Linus Walleij
