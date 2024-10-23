Return-Path: <linux-hwmon+bounces-4506-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E449AD350
	for <lists+linux-hwmon@lfdr.de>; Wed, 23 Oct 2024 19:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C13FD28375C
	for <lists+linux-hwmon@lfdr.de>; Wed, 23 Oct 2024 17:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C868B1CEEA5;
	Wed, 23 Oct 2024 17:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fi9jTksZ"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90751CDA0F
	for <linux-hwmon@vger.kernel.org>; Wed, 23 Oct 2024 17:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729705913; cv=none; b=PxUckZJW6VR9gIYNxopOFmBKZmre0JbJGarIn0pSXiCdMICokc4Kunv9tk8jv06bHEw00tV4HqG5E2FVQSfnXnSE+ly5WgCfTGBUgG+8PPK1xkDHHLGTMAzia6AI+lydNyp2P0BkTsqR5LmgRUXxq4K6qF3qdPYJsAeN0ht870Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729705913; c=relaxed/simple;
	bh=HhCRM8LXsD648EezB/Ag71ruZTVUBPWIrjPd9FGl4yA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxzPi8ezsjk1mBN0XvGMKlZHHw51AuorBl5EUQOw5A8rhOkHT5vg5mrTNWrUiag2LXAzOfOtHp2nudQauMgrG4fVtSWLEFXWzt0HwLQ4kgU3dS7L1IQ/aI1S97m9JxM1raWA4JYzzn8TpOFhminE6gsHk07bCuXRli3Yy242tEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fi9jTksZ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539e63c8678so64986e87.0
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Oct 2024 10:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729705910; x=1730310710; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FLwni55Q0o3LkpPoGPWHU+nZClL0F1PcEd+W91uMukA=;
        b=fi9jTksZojN11gKq00T82zQYyOXza6tSRYeNWlytAt/TBbIoFWCyFPBprNmnQJiwny
         dxYAa1nV/t9PCOkYd3tcw2/t0sB86dcTXyjEiGO88okeqq+9RwKdeXKjZfOAg6F9lxnb
         nE70pK1lrRSLjH9c1j1pL43vCx7x9U+dT4zE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729705910; x=1730310710;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLwni55Q0o3LkpPoGPWHU+nZClL0F1PcEd+W91uMukA=;
        b=b2T+OWumCsvudA61NVgeQvSIgA5Zz5OuBAuzhgwOC3Bl3cjEpNabReGd09fLRAW24q
         TFA6HVXLg/Alvp59zetMM1ywEUx9cAPxDt663cIB1gwIK5o4Y1iSk8XjE4dEQfgRekIB
         dPmO+KUvYu4geT5laF60VVgVmtAUAS3xSbCDWQJBu4TAfLzldhGaZq9CVB/nBfoaAdqe
         mPhNE4avgMuCs+baBUkajplBxe3aHgVhO+zg8y98AYxUV3SXFBd1ckp5tcKYKdgH5yoc
         Wg8yRSFazaqpvaIzGTnru1cs3VKf+p6WN9SwxCAKOhdsxbXjxrzrAt97l0/VteYJ3z+g
         CnVw==
X-Forwarded-Encrypted: i=1; AJvYcCWhMRKiKhM/uvqxJgGC7G4hsqabO5VQ8KCjeupu7ViSak9q0jP4zXw3jI15iuM7X2jW7h34/B5+Ajt1aA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9FqW4JzN6fHHK4P4vI/abkfoOL/pChNmF28856hNRJEQvjcwK
	eakzoXPDS28gurUvWeoSUJUnKldsNOForRiXLBSy5Gz/o7hpfMZdu60adLeKs2vF1D3y9P2is9J
	QOVBnkQ==
X-Google-Smtp-Source: AGHT+IH1Ccd4/hXmtHKNfxMvqY+SERXCvfHSQccTDKZmt+L17BZ6+KPLXU++lQ0+cqykBkzbfzB65w==
X-Received: by 2002:a05:6512:3d27:b0:539:d870:9a51 with SMTP id 2adb3069b0e04-53b1a36b818mr2084842e87.48.1729705909928;
        Wed, 23 Oct 2024 10:51:49 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a22440476sm1123574e87.290.2024.10.23.10.51.48
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 10:51:48 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539e63c8678so64937e87.0
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Oct 2024 10:51:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXVnDjESDYfUvRYenI5ZiTw26kQjafiHjxp1+5Fk0lQwjS51F+qEqqtSdnt9hScD7vFThnErgi6rVX2xQ==@vger.kernel.org
X-Received: by 2002:a17:907:94c3:b0:a9a:8042:bbb8 with SMTP id
 a640c23a62f3a-a9abf94d4b2mr369489566b.47.1729705563762; Wed, 23 Oct 2024
 10:46:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io> <20241023080935.2945-2-kexybiscuit@aosc.io>
 <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org>
In-Reply-To: <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Oct 2024 10:45:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Message-ID: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Tor Vic <torvic9@mailbox.org>
Cc: Kexy Biscuit <kexybiscuit@aosc.io>, jeffbai@aosc.io, gregkh@linuxfoundation.org, 
	wangyuli@uniontech.com, aospan@netup.ru, conor.dooley@microchip.com, 
	ddrokosov@sberdevices.ru, dmaengine@vger.kernel.org, dushistov@mail.ru, 
	fancer.lancer@gmail.com, geert@linux-m68k.org, hoan@os.amperecomputing.com, 
	ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-ide@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, 
	manivannan.sadhasivam@linaro.org, mattst88@gmail.com, netdev@vger.kernel.org, 
	nikita@trvn.ru, ntb@lists.linux.dev, patches@lists.linux.dev, 
	richard.henderson@linaro.org, s.shtylyov@omp.ru, serjk@netup.ru, 
	shc_work@mail.ru, tsbogend@alpha.franken.de, v.georgiev@metrotek.ru, 
	wsa+renesas@sang-engineering.com, xeb@mail.ru
Content-Type: text/plain; charset="UTF-8"

Ok, lots of Russian trolls out and about.

It's entirely clear why the change was done, it's not getting
reverted, and using multiple random anonymous accounts to try to
"grass root" it by Russian troll factories isn't going to change
anything.

And FYI for the actual innocent bystanders who aren't troll farm
accounts - the "various compliance requirements" are not just a US
thing.

If you haven't heard of Russian sanctions yet, you should try to read
the news some day.  And by "news", I don't mean Russian
state-sponsored spam.

As to sending me a revert patch - please use whatever mush you call
brains. I'm Finnish. Did you think I'd be *supporting* Russian
aggression? Apparently it's not just lack of real news, it's lack of
history knowledge too.

                      Linus

