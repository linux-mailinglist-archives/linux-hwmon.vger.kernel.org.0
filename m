Return-Path: <linux-hwmon+bounces-147-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9992D7F32F5
	for <lists+linux-hwmon@lfdr.de>; Tue, 21 Nov 2023 16:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA7571C21BC6
	for <lists+linux-hwmon@lfdr.de>; Tue, 21 Nov 2023 15:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A4759143;
	Tue, 21 Nov 2023 15:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1g3H9ml"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 791CE191;
	Tue, 21 Nov 2023 07:59:19 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1cf62a3b249so15271055ad.0;
        Tue, 21 Nov 2023 07:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700582359; x=1701187159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4LYyNKkmX/uEHFZv6ne32wpjoPjS3cMG64F7aftHlMU=;
        b=b1g3H9ml79e9USUT9B2j2158wbfqoetH9dfEigld+f9KpmnSe+5cv45iy2gq7mHkjp
         OKRaMw1zS7N4fHSaN6lP0l97iGk/lFk2cM7v6OfbLy5Brnx7+xmulxVHQLvX6dx+ILjt
         b/b9c+Jg95jSyoYif9ReTz2cMBn++6hzstNJn4+2NUqscq6HVBJhJkdNTo1c7fIIsLq4
         r5GmtTeCqLPs25QEktNLzSQgJ5L5+Cc/kjrzmiDgGUKI7wPNPOpNVVsl7UdkhXtKX/iT
         OjdOO3kExxTGT/P/d2vnGnSdqMsA1p8AYxAUQL6wgMdfRhVmwUnyFc+4d2NrqPCaS4eF
         8lDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582359; x=1701187159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LYyNKkmX/uEHFZv6ne32wpjoPjS3cMG64F7aftHlMU=;
        b=I1RDU1cjbB08cpl2HJRPq3T3lP+GmW8u+qR2F/TLCnPCX8lU3FQD7HpDJkDdT7Qyll
         gSrnpwaqQKBdAEL8KwPuw1TBOouIPN29nsmIijKfdoLXGqgh1VQ7TorZaQEND7n7v0ZX
         /iBAEbmw3Q/AArSeCnubZCdOeTPMcUH3s8k6S/QBmd/gbLa+0m3ZY1M0WzbZDK8r9s2o
         wmTnmch/dchw/lyDmiVRVHXewEh6L4GZkhiOJo2wkwrNTH5uKOuNxF7mj1L+X8s07j9a
         pRCBE7An/NSdX75jedaP0me+0VuBJKLDfT0hSxs/rHzoGoZPM08sFXjkuOmpxP9a7g/t
         7hzA==
X-Gm-Message-State: AOJu0Yy1Z4V6/tyF4bO0RdranG51PyMRI+PWoiH7Dx3dzo9N6fy/XXPl
	7H9AaILnP96JHIukzO3pawE=
X-Google-Smtp-Source: AGHT+IEruKQliG6flmHqnASEhkc2Xm19UStJK6nxzq22+KzG0YLwvHxxxPxKBtcQYRi7HbInd2BhaA==
X-Received: by 2002:a17:902:e546:b0:1cc:4669:c0eb with SMTP id n6-20020a170902e54600b001cc4669c0ebmr11057412plf.21.1700582358656;
        Tue, 21 Nov 2023 07:59:18 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b14-20020a170902d50e00b001c898328289sm2035486plg.158.2023.11.21.07.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 07:59:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 21 Nov 2023 07:59:16 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Xing Tong Wu <xingtong_wu@163.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, xingtong.wu@siemens.com,
	tobias.schaffner@siemens.com, gerd.haeussler.ext@siemens.com
Subject: Re: [PATCH v3 1/2] hwmon: (nct6775) Add support for 2 additional fan
 controls
Message-ID: <d51bdd07-8ea1-4f33-a205-168dee6d5992@roeck-us.net>
References: <20231121081604.2499-1-xingtong_wu@163.com>
 <20231121081604.2499-2-xingtong_wu@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121081604.2499-2-xingtong_wu@163.com>

On Tue, Nov 21, 2023 at 04:16:03PM +0800, Xing Tong Wu wrote:
> From: Xing Tong Wu <xingtong.wu@siemens.com>
> 
> The nct6116 has 2 additional PWM pins compared to the nct6106.
> Extend the nct6106 PWM arrays to support the nct6116.
> 
> Signed-off-by: Xing Tong Wu <xingtong.wu@siemens.com>

Applied.

Thanks,
Guenter

