Return-Path: <linux-hwmon+bounces-276-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEA9800265
	for <lists+linux-hwmon@lfdr.de>; Fri,  1 Dec 2023 05:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDA4F2815A0
	for <lists+linux-hwmon@lfdr.de>; Fri,  1 Dec 2023 04:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5346D3F;
	Fri,  1 Dec 2023 04:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBDqEhKy"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F4D1719;
	Thu, 30 Nov 2023 20:10:52 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6d81173a219so77823a34.3;
        Thu, 30 Nov 2023 20:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701403851; x=1702008651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cr2IZRlxrOoxX+1aFEHAalHDlrk4FrIdONTrbiOH48k=;
        b=FBDqEhKyuyIaT1kKgMhJqYphDbR+AUXodz1ACixbFDxI6SvqgBQmDR1wxCv+cVLyqv
         Fuc7wWjgVtodpxkNkRyESbgHIepBCxTiRU/STH7vIN1i3DTjKPgf4WJXo+eVwdP1jTDw
         dj1t7leek3XLyX6TB5UAA5IobIo4pgoJplOfuS28vuO8qvnFs8NKT3Sj8bLwL4whKzII
         vddh0ztsIsSwHhVy1wFp50kSdJa9dXXUW85YEfoW1woCZr66mGw5jucLr71/kaqHrFyi
         EReWn9ugTiMGw2bpiHq60LqvR2G6PswYmToQLPZvM1A9+gpNFYhSvUlwmNX8jNF8UyfJ
         9mPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701403851; x=1702008651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cr2IZRlxrOoxX+1aFEHAalHDlrk4FrIdONTrbiOH48k=;
        b=rbYCgTkTHXmxOYaentEAFsa8oJ+jIgwUc3pzwTrgK0Xi/DBK8c12rqlCIgXbX2smwF
         gZyhfq0eN3zltqCUokD1TFbGqSxywlPIqjfnsgjuCCkrclCc+O685rJMofLSWyu06BHo
         3OucDipXJmel3uhWO/aPKQkWZM+XIdtvYtZctUZckL4rFbEi3zmW612E0cFw+WxhvpCp
         /cGhW8Nfh6q/6QN6eFRB6H/suS0IOyvhjNySOLJRsPTrIO4lYQmb4uu2WI/HKJ+5cVX4
         Q5/mN4oZQaLnnflDl4a/FyZecrGcVlB6Hmmks0e6lM7lb+pQplQevWjRkBm+d9MJB8A1
         N6ig==
X-Gm-Message-State: AOJu0YwOLMw2/l/CJwDUhUEq+smz1hMOLFI5yOZ16dqcDs47DQh8GGwR
	rZT77A7pS/4+C+fpeRLyLXxoXMSiFBE=
X-Google-Smtp-Source: AGHT+IGQgse/sIGwmQI1LyNBhgTtyKZ2lzUp0Byc4Qfsx4RvNqByv1oEqiD+PED+FnirLV6L4KPnZw==
X-Received: by 2002:a05:6871:418b:b0:1f9:539b:e9f with SMTP id lc11-20020a056871418b00b001f9539b0e9fmr31929654oab.44.1701403851503;
        Thu, 30 Nov 2023 20:10:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id se6-20020a05687122c600b001faf09f0899sm51629oab.24.2023.11.30.20.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 20:10:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Nov 2023 20:10:50 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Eric Tremblay <etremblay@distech-controls.com>,
	Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v1 3/3] hwmon: tmp513: Use SI constants from units.h
Message-ID: <c465162d-ad34-445f-ae44-80ae21146ec3@roeck-us.net>
References: <20231128180654.395692-1-andriy.shevchenko@linux.intel.com>
 <20231128180654.395692-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128180654.395692-4-andriy.shevchenko@linux.intel.com>

On Tue, Nov 28, 2023 at 08:06:04PM +0200, Andy Shevchenko wrote:
> MILLI and MICRO may be used in the driver to make code more robust
> against possible miscalculations.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied.

Thanks,
Guenter

