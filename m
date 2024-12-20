Return-Path: <linux-hwmon+bounces-5665-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CC39F9274
	for <lists+linux-hwmon@lfdr.de>; Fri, 20 Dec 2024 13:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C527E16C7D6
	for <lists+linux-hwmon@lfdr.de>; Fri, 20 Dec 2024 12:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DE61C5CBC;
	Fri, 20 Dec 2024 12:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eonzgd44"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC4A1C5F21
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Dec 2024 12:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698755; cv=none; b=aylpyXaO3naMl5MWGAPRbMWEvbLVJqsqwCHS7vg4DQYJo9/f79kkMC4Oe/EjRcuc8mfwKvi1/rGubnXYxm+irU7UE5XAPvJ/f+z5UupVf5OXVVM2tX2h8YVmxZznrG3mziW2F7fQbYO8u/Bad1p/Kl9rzTma5L7MF14beKZY1UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698755; c=relaxed/simple;
	bh=eIvJgkvy6HRuXmDaqsB7MX3E+E+alDS9//+kZ9m0t6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3R1iWywuxhAqdg3KMHJpPsjkAqGaj8ZynC1ceTxuumvTND7eZht3oxwLJjnqkGFh9iyysHc8kFPzmAdB7ocnNbVP2WSj772vEt+bZzSKU7/DHVyTrMuSM7f7PZw9/Ga4+S/LTEXNuV/oTnQDlg+t1LrI7j4pqnrP54sVF7MroI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eonzgd44; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54024ecc33dso2156141e87.0
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Dec 2024 04:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734698751; x=1735303551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+v+f0F+ggXM/pkSaGIpemMgLpckgFL+0mqDxCkmiPc=;
        b=eonzgd44hq3ryZG4G65d3usc9iXHmng4QZBz+h6huIRQtPiVzd8RqWpA+IvNyM+afe
         YSWw9pW+g9evbv7WQDtxPQL1j4xjpZvknXtudiwsU6vptgsEq5T45djbDMx9oq08Z5Pb
         wHpiDNUwSNMr2BRGWYATXXMgeuXmIYcaq8l8MWI7JKjIuyAS3BHXB4u2TJMn1nGUaFrS
         DkeTwG3ALTAeLR+y2oWzvNSO6XeFlCYbWXxthmz21GuYLFIN5Rthn2jPyzdNlQfyi1AK
         3Lz6v5eEoF+S0jKzSXWxiUSGNiDGB4I5CH1bDAQzsNjwuup9MQmUM2QI5e7yELEGw6fY
         rXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734698751; x=1735303551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+v+f0F+ggXM/pkSaGIpemMgLpckgFL+0mqDxCkmiPc=;
        b=KN+iyK2I/dchCTxTJoLT1CxpU0n3LBcuGNXTohcVXLZ0EMVEaiIv+CKTHdWntGpTN3
         NN+HBx5YoJoe12nkZuzb4JExh5X1LVBhxDY1xPtnho6kASB5NXHRNKPvzXVaTLv+ojT0
         cBauKEJnob1CnR3NWOW/ERlh/KEfnveRyed175IXiS+SUNrxcuqhnncGENBGskI6Cdw+
         UdRuGH8/DNx6IPoVid0z7CJRUhYyKOOVfdigKS87x0paaHPrqWSLfmSI65cyYzF4Qvn0
         ylu4lrrWzqxaiqH2qAFmmFW/qrqqNMs70NHSmGoHDVAHTyL3BDpYS+TzmqcuuzKXrU2l
         LgJg==
X-Forwarded-Encrypted: i=1; AJvYcCWyo38+UrEsB8Nf/aYtS8O3ImBFbztoKZ5UWQaEMHQg6W0Uiaz+wrWT7KcqAD9dCo8RLBp+hsbRWzhPTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/GnH0tSlok0jEow9XhpzDGTdXQaM7tnKzhS0JvN2fEDmLrf70
	RX4ljrsApYjK5IJLkNwikBtjzFJNMPd1cmRBzH2vyc5xl3cOJp6IdiYOpLqfolk5ODYZx2fxZan
	zsqvcN9sUCROMMHYbx7aUPTZ8zvcBhqR/fwtwnw==
X-Gm-Gg: ASbGnct0TrLKpQ1q9bmZ3PyFpoNT/GCXLd78b2kNO4s7zz7quRLvuVf8ssfhJiVSM4e
	qTGhHJwUR9LxfpILTUcsEPRHFsArxN1T8NyeWhA==
X-Google-Smtp-Source: AGHT+IFQLxoTvDBhmmMtrluimmMG49UjGriPLeDS3/xO9K0D1RUiifqIPS/6LdImELHSoCVS/nonG7W60F+gutNSGmY=
X-Received: by 2002:a05:6512:3f25:b0:540:1be6:f15f with SMTP id
 2adb3069b0e04-542294aceebmr908589e87.0.1734698751140; Fri, 20 Dec 2024
 04:45:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-2-tmyu0@nuvoton.com>
In-Reply-To: <20241210104524.2466586-2-tmyu0@nuvoton.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 13:45:39 +0100
Message-ID: <CACRpkdZh4hCvBN=7beFEgm-mmdwSTW1fd8OZhQO3kr6Cy7P=dA@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ming,

thanks for your patch!

On Tue, Dec 10, 2024 at 11:45=E2=80=AFAM Ming Yu <a0282524688@gmail.com> wr=
ote:

> The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
> 6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
> PWM, and RTC.
>
> This driver implements USB device functionality and shares the
> chip's peripherals as a child device.
>
> Each child device can use the USB functions nct6694_read_msg()
> and nct6694_write_msg() to issue a command. They can also request
> interrupt that will be called when the USB device receives its
> interrupt pipe.
>
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
(...)
> +       while (*int_status) {
> +               int irq =3D __ffs(*int_status);
> +
> +               if (*int_status & (1 << irq))
> +                       generic_handle_irq_safe(irq_find_mapping(nct6694-=
>domain, irq));
> +
> +               *int_status &=3D ~(1 << irq);

What about doing what you do in the GPIO driver and
#include <linux/bits.h>

And search and replace "(1 << irq)" with BIT(irq)?

PS the main reason we do this is because

int a =3D (1 << 31);

becomes a negative number on 32bit machines, and
can lead to confusing side effects. BIT() always work
on unsigned.

Yours,
Linus Walleij

